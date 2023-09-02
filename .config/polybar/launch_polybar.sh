if type "xrandr"; then
	m=$(xrandr -q | grep " connected primary" | cut -d" " -f1)
	echo "Launching polybar on primary monitor $m"
	MONITOR=$PRIM polybar --reload primary &
	for m in $(xrandr -q | grep " connected [1-9]" | cut -d" " -f1); do
		echo "Launching polybar on auxillary monitor $m"
		MONITOR=$m polybar --reload auxillary &
	done
else
	polybar --reload primary &
fi
