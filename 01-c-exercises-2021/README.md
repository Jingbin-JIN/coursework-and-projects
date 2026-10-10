# C exercises (2021, first-year programming course)

Weekly C exercises from a first-year programming course I took in autumn 2021 (SungKyunKwan University). The problems were solved and auto-graded on the goorm EDU platform; this folder contains my submission for each problem, one per directory (`WXX_N_title/main.c`, where XX is the week and N the problem number).

Every file builds with `gcc -std=c11 -Wall main.c` and reads its input from standard input, as the grader did.

| Week | # | Directory | Problem |
|---|---|---|---|
| 01 | 1 | `W01_1_hello_young` | Hello, Young (follow-up exercise) |
| 02 | 1 | `W02_1_circle_information` | Circle information |
| 02 | 2 | `W02_2_show_time` | Show time |
| 02 | 3 | `W02_3_split_digits` | Split digits |
| 03 | 1 | `W03_1_triangle_inequality` | Triangle inequality |
| 03 | 2 | `W03_2_registration_number` | Registration number |
| 03 | 3 | `W03_3_a_number_with_all_evens` | A number with all evens |
| 04 | 1 | `W04_1_factorial_of_odd_numbers` | Factorial of odd numbers |
| 04 | 2 | `W04_2_diamond` | Diamond |
| 04 | 3 | `W04_3_prime_number` | Prime number |
| 05 | 1 | `W05_1_sum_function` | Sum function |
| 05 | 2 | `W05_2_combinations_with_prime_nums` | Combinations with prime numbers |
| 05 | 3 | `W05_3_reverse_printer` | Reverse printer |
| 06 | 1 | `W06_1_how_many_times_should_we_update_recursive` | How many times should we update? (recursive) |
| 06 | 2 | `W06_2_reverse_printer_recursive` | Reverse printer (recursive) |
| 06 | 3 | `W06_3_sum_of_digits_of_a_number_recursive` | Sum of digits of a number (recursive) |
| 07 | 1 | `W07_1_stop_rolling` | Stop rolling |
| 07 | 2 | `W07_2_distance_between_characters` | Distance between characters |
| 07 | 3 | `W07_3_case_converter` | Case converter |
| 08 | 1 | `W08_1_swap_in_an_array` | Swap in an array |
| 08 | 2 | `W08_2_randomize_an_array` | Randomize an array |
| 08 | 3 | `W08_3_erase_ones` | Erase ones |
| 09 | 1 | `W09_1_find_max_and_the_index` | Find max and the index |
| 09 | 2 | `W09_2_word_length_and_reversing` | Word length and reversing |
| 10 | 1 | `W10_1_rotate_a_matrix` | Rotate a matrix |
| 10 | 2 | `W10_2_summing_or_subtracting_a_matrix` | Summing or subtracting a matrix |
| 10 | 3 | `W10_3_correct_errors` | Correct errors |
| 11 | 1 | `W11_1_array_printer` | Array printer |
| 11 | 2 | `W11_2_swap_the_whole_array` | Swap the whole array |
| 11 | 3 | `W11_3_move_max` | Move max |
| 12 | 2 | `W12_2_count_the_number_of_occurrences` | Count the number of occurrences |

## Notes on this copy

The exercise platform gave every problem a skeleton with comments such as `// Fill in here` and a block of suggested output strings; those skeleton remnants were removed when this folder was prepared, two unused skeleton variables were deleted (`W08_3`, `W11_3`), and the grader's non-standard `#define string.h FORBIDDEN` guard in `W09_2` was replaced by a comment. Trailing whitespace was normalised. The program logic is unchanged from what was submitted.
