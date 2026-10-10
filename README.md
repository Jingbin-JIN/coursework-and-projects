# Coursework and projects — Jingbin JIN

Code I wrote during my undergraduate studies in Electronic and Electrical Engineering at SungKyunKwan University (2021–), collected in one place for review. Each directory has its own README that says what the work is, which files are mine and which were provided by the course, and what (if anything) was changed when the copy was prepared.

| Directory | When | Language | What it is |
|---|---|---|---|
| [`01-c-exercises-2021`](01-c-exercises-2021) | autumn 2021 | C | 31 weekly exercises from a first-year programming course (goorm EDU) |
| [`02-c-programming-2022`](02-c-programming-2022) | spring 2022 | C | assignments from the department's programming practice course (EEE2022): calendar, matrix pooling, flood fill, circular queue, string merge, record sorting, linked list |
| [`03-logic-design-lab-2023`](03-logic-design-lab-2023) | spring 2023 | Verilog | nine weekly labs — gates, adders, mux/demux, encoders, latches, flip-flops, registers, counters, Moore/Mealy FSMs — with file-by-file provenance |
| [`04-fpga-music-player-2023`](04-fpga-music-player-2023) | spring 2023 | Verilog | term project of the same lab: a digital music player on a Xilinx Artix-7 board (team of four) |
| [`05-data-analysis-notebooks`](05-data-analysis-notebooks) | — | Python | two lab notebooks (pandas, matplotlib, seaborn) from an introductory data-analysis course |
| [`06-csharp-web-scraping-2023`](06-csharp-web-scraping-2023) | 2023 | C# | a small Selenium + EPPlus console program written as a take-home exercise before my industrial placement |

Two larger projects live in their own repositories:

- **[assistive-walker-ros2](https://github.com/Jingbin-JIN/assistive-walker-ros2)** — the ROS 2 software of an AI-based smart walker for the visually impaired (webcam + 2D LiDAR obstacle warning; capstone design, Sep–Dec 2025, ten-person team; GPL-3 because it builds on a GPL-licensed course framework).
- **[naver-review-crawler](https://github.com/Jingbin-JIN/naver-review-crawler)** — a Python crawler/analysis tool for restaurant reviews on Naver Place, written for a 2026 undergraduate research project.

## Work not included

Code written for my employers is proprietary and is not in this or any public repository: the backend services, data models and workflow automation I develop at Australia Network Services Pty Ltd (Sydney, Node.js/Express with MySQL, PostgreSQL and MongoDB; May 2026–present), and the C#/.NET work on the RPA authoring tool *beBOT Studio* during my industrial placement at bluesolutions (Seoul, September–December 2023). I am happy to describe either in conversation.

## How this copy was prepared

In October 2026 I went through the original submission folders to make them readable and runnable as a set: files were organised and renamed, the few programs that only built with Microsoft-specific functions were ported to standard C, a handful of incomplete files were completed, and every program, module and notebook was built or simulated again. I did this with the help of an AI assistant (Claude); each README lists the changes made, and the program logic is otherwise what I wrote at the time.

## License

My own files are released under the MIT License (see [`LICENSE`](LICENSE)). Course-provided files are identified as such in the per-directory READMEs and remain the property of their authors; they are included only so that each directory compiles and simulates on its own.
