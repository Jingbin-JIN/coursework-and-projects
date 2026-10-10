# FPGA music player (Verilog, spring 2023)

Term project of the Logic Circuit Design Lab (SungKyunKwan University, spring 2023), built by a team of four; this is the team's RTL, which I keep here as a member of that team. Target: a Xilinx Artix-7 FPGA board with DIP switches, push buttons, a buzzer, LEDs and a 7-segment display; synthesis and I/O planning in the Xilinx toolchain, simulation in ModelSim.

What it does:

- DIP switch 1 resets the player; while it is held, DIP switch 2 selects one of two children's songs, *Airplane* (비행기, 26 notes) or *School Bell* (학교종, 24 notes), stored as sequences of 3-bit note codes;
- the centre push button starts and pauses playback (`oneshot` turns each press into a single tick);
- notes are played on the buzzer, one per second, from a 1-second clock divided down from the board's 100 MHz clock;
- LEDs 13–16 blink with the beat; each can be enabled or disabled with DIP switches 13–16;
- the two-digit 7-segment display counts down the remaining notes of the song (digits multiplexed at 1 kHz).

## Files

| File | Role |
|---|---|
| `rtl/top.v` | top level: 1 s and 1 kHz clock dividers, the play/pause state register and the note counter `order`, song selection, LED lever logic, the countdown timer and the 7-segment digit driver; the comments at the top (Korean) describe the board wiring |
| `rtl/oneshot.v` | one-clock pulse on the rising edge of a button input |
| `rtl/buzzer_gen.v` | buzzer tone generator: a 3-bit tone-select input (mute, Do … Si) chooses the half-period count that toggles the buzzer pin |
| `rtl/song_plane.v`, `rtl/song_school.v` | note memories for the two songs, indexed by `order` |
| `testbench/tb_top.v` | top-level testbench: reset, start, pause and resume (for simulation, use the shorter divider constants commented in `top.v` and `buzzer_gen.v`) |

Check: `iverilog -g2005 -o sim rtl/*.v testbench/tb_top.v`.

## Notes on this copy

The comments in `top.v` were in EUC-KR encoding and were converted to UTF-8 so they display correctly; trailing whitespace was normalised. Nothing else was changed.
