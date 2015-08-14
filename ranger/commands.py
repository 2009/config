# This is a sample commands.py.  You can add your own commands here.
#
# Please refer to commands_full.py for all the default commands and a complete
# documentation.  Do NOT add them all here, or you may end up with defunct
# commands when upgrading ranger.

# You always need to import ranger.api.commands here to get the Command class:
from ranger.api.commands import *
from ranger.core.loader import CommandLoader
import shutil
import os

class extracthere(Command):
    def execute(self):
        """ Extract copied files to current directory """
        copied_files = tuple(self.fm.copy_buffer)

        if not copied_files:
            return

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        one_file = copied_files[0]
        cwd = self.fm.thisdir
        original_path = cwd.path
        au_flags = ['-X', cwd.path]
        au_flags += self.line.split()[1:]
        au_flags += ['-e']

        self.fm.copy_buffer.clear()
        self.fm.cut_buffer = False
        if len(copied_files) == 1:
            descr = "extracting: " + os.path.basename(one_file.path)
        else:
            descr = "extracting files from: " + os.path.basename(one_file.dirname)
        obj = CommandLoader(args=['aunpack'] + au_flags \
                + [f.path for f in copied_files], descr=descr)

        obj.signal_bind('after', refresh)
        self.fm.loader.add(obj)

class compress(Command):
    def execute(self):
        """ Compress marked files to current directory """
        cwd = self.fm.thisdir
        marked_files = cwd.get_selection()

        if not marked_files:
            return

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        original_path = cwd.path
        parts = self.line.split()
        au_flags = parts[1:]

        descr = "compressing files in: " + os.path.basename(parts[1])
        obj = CommandLoader(args=['apack'] + au_flags + \
                [os.path.relpath(f.path, cwd.path) for f in marked_files], descr=descr)

        obj.signal_bind('after', refresh)
        self.fm.loader.add(obj)

    def tab(self):
        """ Complete with current folder name """

        extension = ['.zip', '.tar.gz', '.rar', '.7z']
        return ['compress ' + os.path.basename(self.fm.thisdir.path) + ext for ext in extension]

class movie2dir(Command):
    """:movie2dir <dir>

    Renames media and subtitles to their directory name and moves anything else to /tmp.
    """
    def execute(self):

        selection = self.fm.thistab.get_selection()
        if len(selection) == 0: return

        directories = ''
        for f in selection:
            if f.is_directory:
                directories += ' '
                directories += '\"'
                directories += f.path
                directories += '\"'

        os.system('~/.config/ranger/movie2dir.sh'+directories+' &> /dev/null')
        self.fm.notify("Done!")


class movieAutoName(Command):
    """:movieAutoName

    Renames folder automatically based on title.
    """

    quality_attributes = ["1080p", "720p", "480p", "xvid", "1080i", "1080"]
    format_string = "%t (%y)"

    def execute(self):

        selection = self.fm.thistab.get_selection()
        if len(selection) == 0: return

        for f in selection:
            if f.is_directory or f.is_file:

                fields = self.populate_fields(f.basename);
                fields['title'] = self.titlize(fields['title'])

                if fields:

                    # Generate new name based on fiels and format string
                    new_name = self.format_name(fields, self.format_string)

                    # Rename the directory to the new name
                    if f.is_directory:
                        if self.fm.rename(f, new_name):
                            self.fm.notify(new_name+' :: done!')
                        else:
                            self.fm.notify('Sorry I have failed you master.', bad=True)

                    # Create a new directory for this file and move the file into it
                    elif f.is_file:
                        new_path     = os.path.join(self.fm.thisdir.path, new_name)
                        new_filepath = os.path.join(new_path, f.basename)

                        if not os.path.lexists(new_path):
                            os.makedirs(new_path)
                            try:
                                shutil.move(f.path, new_filepath)
                            except Exception as e:
                                self.fm.notify(e, bad=True)
                        else:
                            self.fm.notify('Whoops, there is already a directory for this file? :: '+new_name, bad=True)
                else:
                    self.fm.notify('Sorry I have have no title but failure.', bad=True)
            else:
                self.fm.notify('Not a file or directory.', bad=True)


    def populate_fields(self, filename):
        """ Parses the filename and returns an object with fields needed for renaming """

        fields = {
            'year': None,
            'quality': None,
            'title': [],
            'extension': None,
            'extra': [],
        }

        filename = filename.lower()
        elems = re.split('[\[\] _.-]', filename) 

        # parse each filename element except the extension
        for idx, elem in enumerate(elems):

            # Check that the element is long enough to contain episode & season info
            if len(elem) > 2:

                # sanitize brackets
                if elem[0] == '[': 
                    closeindex = elem.rfind(']')
                    elem       = elem[1:closeindex if closeindex != -1 else len(elem)]
                    elems[idx] = elem
                elif elem[0] == '(':
                    closeindex = elem.rfind(')')
                    elem       = elem[1:closeindex if closeindex != -1 else len(elem)]
                    elems[idx] = elem

                # found quality
                if elem in self.quality_attributes:
                    fields['quality'] = elem

                # found a year
                if elem[0:2] in ["19", "20"] and elem[2:4].isdigit():
                    fields['year'] = elem

                    # Everything after the year is considered extra
                    for j in range(idx + 1, len(elems) - 1):
                        if elems[j] in self.quality_attributes:
                            fields['quality'] = elems[j]
                        elif not elems[j].isdigit():
                            fields['extra'].append(elems[j])

                    return fields

            # Determined this element to be part of the title so add it
            if elem not in fields['extra'] and len(elem) > 0:
                fields['title'].append(elem)

        return fields

    def titlize(self, title):

        # Word not to capitalize
        SMALL = ['a', 'an', 'and', 'as', 'at', 'but', 'by', 'for', 'if', 'in', 'of', 'on', 'or', 'to', 'v', 'via', 'vs', 'with']

        """ Joins a string array and emulates titlecase returning the str result """
        result = ""
        if len(title) > 0: # First word always capital
            if title[0] == "its":
                result += "It's"
            else:
                result += title[0][0].upper()
                result += title[0][1:]

        if len(title) > 1:
            for word in title[1:]:
                if word in SMALL:
                    result += " "
                    result += word
                elif len(word) == 0:
                    continue
                else:
                    result += " "
                    result += word[0].upper()
                    result += word[1:]
        return result

    def format_name(self, fields, format_string):
        """ Replaces format string with available fields """
        index = 0
        final = ""

        format_index  = self.index_fs(format_string)

        # If the fs expects an element that wasn't found, just return the title... crappy input
        if "%y" in format_string and not fields['year'] or "%q" in format_string and not fields['quality']:
            return fields['title']

        for i in range(len(format_index)):
            final  += format_string[index:format_index[i]]        
            index   = format_index[i]+1
            fstemp  = format_string[index:]
            index  += 1

            if   fstemp[0] == 't': final += fields['title']
            elif fstemp[0] == 'T': final += fields['title'].upper()
            elif fstemp[0] == 'y': final += fields['year']
            elif fstemp[0] == 'q': final += fields['quality']
        final += format_string[index:]
        return final

    def index_fs(self, fs):
        """ Returns int[] with the indices of each % in the format string fs """
        indices = []
        i = 0
        for char in fs:
            if char == '%': indices.append(i)
            i += 1
        return indices
