#!/bin/sh

# Define active window name
Active_window() {
    ACTIVE_WINDOW=$(xdotool getactivewindow getwindowname)
    echo $ACTIVE_WINDOW
}

# Define workspaces
Workspaces() {
    WORKSPACE_COUNT=$(wmctrl -d | wc -l)
    RESULT=''
    for ((i = 1; i<=$WORKSPACE_COUNT; i++)) do
	LINE=$(wmctrl -d | sed "$i!d")

	WORKSPACE_STATUS=$(echo $LINE | awk '{print $2}')
	WORKSPACE_NAME=$(echo $LINE | awk '{print $9}')
	if [[ "$WORKSPACE_STATUS" != '-' ]]; then
	    RESULT="$RESULT | @ "
	else
	    RESULT="$RESULT | $WORKSPACE_NAME"
	fi
    done
    echo $RESULT
}

# Define clock
Clock() {
    DATETIME_RES=$(date +"%Y %m %d / %T")
    echo $DATETIME_RES
}

# Define battery
Battery() {
    BATTERY_CH=$(acpi | gawk -F ',' '{print $2}' | cut -c 2-)
    echo $BATTERY_CH
}

while true; do
    WORKSPACES="$(Workspaces)"
    WINDOWNAME="$(Active_window)"
    DATE="%{F#FFFF00}%{B#0000FF} $(Clock) %{F-}%{B-}"
    BATTERY="$(Battery)"

    LEFT="%{l} $WORKSPACES |"
    CENTER="%{c} $WINDOWNAME"
    RIGHT="%{r} $BATTERY | $DATE"
    echo "$LEFT $CENTER $RIGHT"
done
