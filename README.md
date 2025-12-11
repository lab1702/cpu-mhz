# CPU MHz Visualizer

A gnuplot script that displays real-time CPU core frequencies as a bar chart.

## Features

- Live-updating bar chart showing per-core MHz frequencies
- Cores sorted by frequency (highest to lowest)
- Dark theme with gray text and blue bars
- Auto-scales Y-axis to CPU's maximum frequency
- Refreshes every second

## Requirements

- gnuplot
- lscpu (part of util-linux)

## Usage

```bash
gnuplot cpu_mhz.gp
```

Press `Ctrl+C` to exit.

## Screenshot

The visualization shows a horizontal bar chart where:
- X-axis: CPU cores (sorted by current frequency)
- Y-axis: Frequency in MHz (0 to max supported frequency)
- Blue bars represent current frequency of each core
