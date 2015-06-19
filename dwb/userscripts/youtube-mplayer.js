//!javascript
var regex = new RegExp("https?://www.youtube.com/watch\\?(.*&)*v=.*");

Signal.connect("navigation", function (wv, frame, request) {
  if (wv.mainFrame == frame && regex.test(request.uri)) {
    system.spawn("sh -c 'mplayer \"$(youtube-dl -g --prefer-insecure " + request.uri + ")\"'");
    system.spawn("notify-send -u low \"Opening youtube\"");
  }

  return false;
});
