# CPU MHz visualization script
# Usage: gnuplot cpu_mhz.gp

set title "CPU Core Frequencies (MHz)"
set xlabel "Core (sorted by frequency)"
set ylabel "MHz"
set style fill solid 0.8
set boxwidth 0.8
set grid xtics ytics

# Colors
set object 1 rectangle from screen 0,0 to screen 1,1 behind fillcolor rgb "black" fillstyle solid
set border linecolor rgb "gray"
set grid linecolor rgb "gray"
set tics textcolor rgb "gray"
set title textcolor rgb "gray"
set xlabel textcolor rgb "gray"
set ylabel textcolor rgb "gray"
set key textcolor rgb "gray"

# Get min/max MHz limits and core count from CPU specs
set datafile separator ","
stats '< lscpu -p=MINMHZ,MAXMHZ | grep -v "^#"' using 1:2 nooutput
ymax = STATS_max_y
xmax = STATS_records - 1
set yrange [0:ymax]
set xrange [-0.5:xmax+0.5]
set datafile separator whitespace

# Refresh plot every 1 second
while (1) {
    plot '< lscpu -p=MHZ | sort -rn' using 0:1 with boxes notitle fillcolor rgb "#6495ED"
    pause 1
}
