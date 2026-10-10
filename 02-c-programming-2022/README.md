# C programming assignments (EEE2022, spring 2022)

Weekly assignments from the second-year programming practice course of the electrical and electronic engineering department (course code EEE2022, 전자전기프로그래밍실습; SungKyunKwan University, spring 2022). One directory per assignment; the number is the assignment number. Assignments 04 and 12 (part 1) were hand-written answers and are not included.

| # | Directory | Program | Input |
|---|---|---|---|
| 01 | `01_hello_world` | Hello world | — |
| 02 | `02_basic_io` | Two small I/O exercises: print an integer in hexadecimal; convert an upper-case letter to lower case | stdin |
| 03 | `03_leap_year` | Leap-year test with a single conditional expression | stdin |
| 05 | `05_month_calendar` | Prints the calendar page for a given year and month (day-of-week computed from the year, leap years handled) | stdin: `year month` |
| 06 | `06_second_largest_pooling` | Repeatedly pools an N×N matrix (N a power of two) with 2×2 windows, keeping the second-largest value of each window, until one value remains | `input.txt` |
| 07 | `07_count_islands` | Counts connected regions of 1s in a 0/1 grid by recursive flood fill | `input.txt` |
| 08 | `08_circular_queue` | Fixed-size circular queue of characters driven by a command file (`E`nqueue / `D`equeue), with full/empty handling | `input.txt` |
| 09 | `09_merge_sorted_strings` | Merges N alphabetically sorted strings into one, comparing letters case-insensitively | file given as `argv[1]` |
| 10 | `10_student_records` | Reads student records (height in feet/inches, weight), sorts them, and writes the tallest/shortest/heaviest/lightest students (with ties) and averages to `output_<N>.txt` | file given as `argv[1]` |
| 11 | `11_sorted_linked_list` | Sorted singly linked list with insert and delete commands read from a file; prints the list after each command | file name on stdin |
| 12 | `12_yearly_averages` | Reads a monthly stock-market CSV (S&P composite, dividends, earnings, CPI, …), averages one chosen column per year into a `.dat` file and, with `-p`, plots it with the course's xgraph; `output/` holds the nine `.dat`/`.pdf` results produced for the assignment | `csv index [-p]` on the command line |

Build any of them with `gcc -std=c11 -Wall file.c`. Example inputs used to check the programs are in `examples/`.

## Notes on this copy

The assignments were written in Xcode on macOS and, for the later ones, in Visual Studio on Windows, so several files used Microsoft-only functions (`fopen_s`, `fscanf_s`, `sprintf_s`, …) or had been left in a state that no longer compiled on a Unix system. When this folder was prepared for review (October 2026) they were made to build with gcc, keeping the original logic:

| File | Change |
|---|---|
| `01_hello_world/hello_world.c` | typo "Wolrd" → "World"; `return 1` → `return 0` |
| `03_leap_year/leap_year.c` | added the missing `return 0;` |
| `05_month_calendar/month_calendar.c` | header comment only (stray project name) |
| `06_second_largest_pooling/…` | `fopen(&ifp, "input.txt")` (did not compile) → `ifp = fopen("input.txt", "r")`; two no-op statements (`input[n][n];`, `input[n/2][n/2];`) removed |
| `07_count_islands/…` | did not compile: same `fopen` fix, the undeclared loop variable `i` declared, the recursive `land()` made `void` (it returned nothing on the recursive path); `fclose`/`return 0` added |
| `08_circular_queue/…` | did not compile: same `fopen` fix, nothing else |
| `09_merge_sorted_strings/…` | `fopen_s`/`fscanf_s` → `fopen`/`fscanf`; the final loop printed all 1024 bytes of the buffer (including NUL bytes) and now prints the string once; `fclose`/`return 0` added |
| `10_student_records/…` | `void main` → `int main`; `fopen_s`/`fscanf_s`/`sprintf_s`/`strcat_s`/`fprintf_s` → standard equivalents; `fclose(output)` added |
| `11_sorted_linked_list/…` | `gets_s`/`fopen_s`/`fscanf_s` → `fgets` (newline stripped)/`fopen`/`fscanf`; the prompt string, which echoed the sample command line from the assignment sheet, replaced by `input file: `; `delete()` returns `NULL` when the value is absent instead of falling off the end; two unused variables removed; `fclose` added |
| `12_yearly_averages/…` | Windows-only `direct.h`/`_getcwd` → `getcwd` behind a two-line platform guard; `sprintf_s`/`fopen_s` → `snprintf`/`fopen` (one `sizeof` argument corrected from `f1` to `f2`); the optional third argument is checked before use (`argv[3]` was read even when absent) and a usage message added; a stray debug `printf` of the plot flag and a doubled semicolon removed; header comment added |

The Xcode header comments carry my name in its Latin spelling. Everything else is as submitted.
