# Bid-notice scraper to Excel (C#, August 2023)

A small .NET 6 console program written in August 2023 as a take-home exercise before my industrial placement at a C#/.NET company. It searches the Korean public procurement portal (나라장터, g2b.go.kr) for bid notices whose title contains a keyword, posted within the last five days, and appends them to an Excel workbook.

How it works (`WebScrapingAndExcel/Program.cs`, ~110 lines):

1. Selenium WebDriver opens the portal in Chrome, types the keyword and the start date into the search form and clicks *search*.
2. The result table lives inside nested frames (`sub` → `main`); the program switches into them and reads every row of `.table_list_tbidTbl`.
3. With EPPlus it opens the workbook (or creates it with a header row — 공고명 / 검색 키워드 / 공고 기관 / 수요 기관 / 입력 일시 / 검색 일시) and appends one row per notice: title, keyword, announcing agency, demanding agency, posting time and search time.

Build and run with the .NET 6 SDK and a Chrome installation:

```
cd WebScrapingAndExcel
dotnet run -- [path\to\workbook.xlsx] [keyword]      # defaults: 장표.xlsx in the current directory, "RPA"
```

The portal's page structure (element ids, frame names, column order) is as it was in August 2023 and may have changed since.

## Notes on this copy

The submitted version had the workbook path hard-coded to a Windows desktop path, with a note telling the reviewer which line to edit; it now takes the path and the keyword as optional command-line arguments with sensible defaults. Line endings were normalised. Nothing else was changed — identifiers and comments are in Korean, as written.
