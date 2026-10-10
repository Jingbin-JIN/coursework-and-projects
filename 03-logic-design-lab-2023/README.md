# Logic circuit design lab (Verilog, spring 2023)

Weekly Verilog labs from *논리회로설계실험* (Logic Circuit Design Lab, SungKyunKwan University, spring 2023, third year). Each week we received a kit of course-provided modules plus skeleton files to complete, wrote the week's homework modules and a testbench, and verified everything in ModelSim. Each directory here holds one week and simulates on its own:

```
cd W03_adders && iverilog -g2005 -o sim *.v && vvp sim      # Icarus Verilog; the testbenches were written for ModelSim and run until stopped
```

Which files are mine is stated per week below. Three categories are used: **written** — module written from scratch; **completed / adapted** — a course skeleton that I implemented (modules: ports given, body to write) or a course file that I modified (testbenches were adapted from the previous week's; two flip-flops in week 9 were given an asynchronous reset); **course kit** — provided by the course and unchanged, kept so that the directory compiles. The classification was made by comparing each file against the course kits.

| Directory | Topic |
|---|---|
| `W02_xor_xnor_gates` | XOR / XNOR gates in dataflow, gate-level and behavioral modeling |
| `W03_adders` | Half adder, full adder (three modeling styles) and a 4-bit ripple-carry adder |
| `W04_mux_demux` | 2:1 / 4:1 multiplexers and 1:2 / 1:4 demultiplexers |
| `W05_encoders_decoders` | 4:2 encoder, 2:4 decoder and 4:2 priority encoder |
| `W06_latches` | SR latch, gated SR latch and D latch |
| `W07_flip_flops` | SR, D, JK and T flip-flops (behavioral and structural) |
| `W08_registers` | 1-bit / 8-bit registers and 8-bit shift registers, structural versions |
| `W09_counters` | Counters: fixing the ripple counter's reset, plus structural ripple and ring counters |
| `W10_fsm_counters` | 3-bit up/down counters as Moore and Mealy finite-state machines |

## W02_xor_xnor_gates

- **Completed / adapted:** `xor_dataflow_gate.v`, `xor_gatelevel_module.v`, `xor_behavioral_module.v`, `xnor_dataflow_gate.v`, `xnor_gatelevel_module.v`, `xnor_behavioral_module.v`
- **Added when preparing this copy:** `and_gate.v` — course kit; `or_gate.v` — course kit; `not_gate.v` — course kit; `nor_dataflow_gate.v` — course kit (NOR example); `nor_gatelevel_module.v` — course kit (NOR example); two `include` lines removed so that the folder compiles as one set; `nor_behavioral_module.v` — course kit (NOR example); `tb_w2.v` — course kit testbench; the six instantiation lines were added here

## W03_adders

- **Completed / adapted:** `half_adder_gatelevel.v`, `full_adder_dataflow.v`, `full_adder_gatelevel.v`, `four_bit_full_adder.v`, `tb_w3.v`
- **Course kit (unchanged):** `and_gate.v`, `or_gate.v`, `not_gate.v`, `half_adder_behavioral.v`, `half_adder_dataflow.v`, `full_adder_behavioral.v`
- **Added when preparing this copy:** `xor_gatelevel_module.v` — my week-2 module, required by the gate-level adders; `xnor_gatelevel_module.v` — my week-2 module, required by the gate-level adders

## W04_mux_demux

- **Completed / adapted:** `four_to_one_mux_dataflow.v`, `four_to_one_mux_gatelevel.v`, `one_to_four_demux_dataflow.v`, `one_to_four_demux_gatelevel.v`, `tb_w4.v`
- **Course kit (unchanged):** `and_gate.v`, `or_gate.v`, `not_gate.v`, `two_to_one_mux_behavioral.v`, `two_to_one_mux_dataflow.v`, `two_to_one_mux_gatelevel.v`, `four_to_one_mux_behavioral.v`, `one_to_two_demux_behavioral.v`, `one_to_two_demux_dataflow.v`, `one_to_two_demux_gatelevel.v`, `one_to_four_demux_behavioral.v`

## W05_encoders_decoders

- **Completed / adapted:** `four_to_two_priority_encoder_behavioral.v`, `four_to_two_priority_encoder_dataflow.v`, `four_to_two_priority_encoder_gatelevel.v`, `tb_w5.v`
- **Course kit (unchanged):** `and_gate.v`, `or_gate.v`, `not_gate.v`, `four_to_two_encoder_behavioral.v`, `four_to_two_encoder_dataflow.v`, `four_to_two_encoder_gatelevel.v`, `two_to_four_decoder_behavioral.v`, `two_to_four_decoder_dataflow.v`, `two_to_four_decoder_gatelevel.v`

## W06_latches

- **Completed / adapted:** `d_latch_behavioral.v`, `d_latch_dataflow.v`, `d_latch_gatelevel.v`, `d_latch_structural.v`, `tb_w6.v`
- **Course kit (unchanged):** `and_gate.v`, `or_gate.v`, `not_gate.v`, `sr_latch_behavioral.v`, `sr_latch_dataflow.v`, `sr_latch_gatelevel.v`, `gated_sr_latch_behavioral.v`, `gated_sr_latch_dataflow.v`, `gated_sr_latch_gatelevel.v`

## W07_flip_flops

- **Written:** `jk_flip_flop_behavioral_module.v`, `jk_flip_flop_structural_module.v`, `t_flip_flop_behavioral_module.v`, `t_flip_flop_structural_module.v`
- **Completed / adapted:** `tb_w7.v`
- **Course kit (unchanged):** `and_gate.v`, `or_gate.v`, `not_gate.v`, `adder.v`, `adder2.v`, `sr_flip_flop_behavioral.v`, `sr_flip_flop_dataflow.v`, `sr_flip_flop_gatelevel.v`, `d_flip_flop_behavioral.v`, `d_flip_flop_structural.v`

## W08_registers

- **Written:** `8_bit_register_structural.v`, `8_bit_shift_register_structural.v`
- **Completed / adapted:** `1_bit_register_behavioral.v`, `8_bit_register_behavioral.v`, `tb_w8.v`
- **Course kit (unchanged):** `and_gate.v`, `or_gate.v`, `not_gate.v`, `8_bit_shift_register_behavioral1.v`, `8_bit_shift_register_behavioral2.v`, `8_bit_shift_register_behavioral3.v`

## W09_counters

- **Written:** `ripple_counter2_module.v`, `ring_counter_structural_module.v`
- **Completed / adapted:** `d_flip_flop_behavioral.v`, `jk_flip_flop_behavioral.v`
- **Course kit (unchanged):** `simple_counter_behavioral.v`, `updown_counter_behavioral.v`, `ripple_up_counter.v`, `ring_counter_behavioral.v`, `tb_w9.v`

## W10_fsm_counters

- **Written:** `three_bit_up_down_counter_moore_module.v`, `three_bit_up_down_counter_mealy_module.v`
- **Completed / adapted:** `tb_w10.v`
- **Course kit (unchanged):** `moore_machine_example.v`, `mealy_machine_example.v`

## Notes on this copy

- `W09_counters/ripple_counter2_module.v` and `ring_counter_structural_module.v` (the week-9 homework: a JK-flip-flop ripple counter and a D-flip-flop ring counter with asynchronous reset and preset) were missing from the submitted folder; they were restored from the code shown in my lab report for that week and re-checked in simulation (0000→1111 and 0001→0010→0100→1000 sequences as reported).
- `W02_xor_xnor_gates` was submitted without the course kit, so the kit's primitive gates, the NOR example and the testbench were added; the six instantiation lines the testbench skeleton asked for were filled in here (the report's waveform shows the same signal names).
- `W03_adders` reuses my week-2 XOR/XNOR gate-level modules, which the gate-level adders instantiate.
- Line endings and trailing whitespace were normalised; the lab reports (Korean) are not included.
