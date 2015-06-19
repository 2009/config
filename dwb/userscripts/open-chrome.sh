#!/bin/bash
# dwb: xc
chromium $DWB_URI &
notify-send -u low "Chrome opening $DWB_URI" #optional notification
