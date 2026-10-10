using System;
using System.IO;
using System.Threading;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;
using OfficeOpenXml;
using System.Runtime.InteropServices;
using OpenQA.Selenium.Support.UI;
using OfficeOpenXml.Style;

class Program
{
    static void Main(string[] args)
    {
        ExcelPackage.LicenseContext = LicenseContext.NonCommercial;

        // Usage: WebScrapingAndExcel [excel file] [keyword]
        //   excel file : workbook the results are appended to (created if it does not exist);
        //                default: 장표.xlsx in the current directory
        //   keyword    : bid-notice keyword to search for; default: RPA
        string 엑셀파일경로 = args.Length > 0 ? args[0] : Path.Combine(Directory.GetCurrentDirectory(), "장표.xlsx");
        string 키워드 = args.Length > 1 ? args[1] : "RPA";
        FileInfo 엑셀파일 = new FileInfo(엑셀파일경로);

        // 웹 드라이버 초기화
        using (IWebDriver driver = new ChromeDriver())
        {
            driver.Navigate().GoToUrl("https://www.g2b.go.kr/index.jsp");

            // 공고명 입력
            IWebElement 공고명Input = driver.FindElement(By.Id("bidNm"));
            공고명Input.SendKeys(키워드);

            // 공고일자 입력
            string 최근5일날짜 = DateTime.Now.AddDays(-5).ToString("yyyy-MM-dd");
            IWebElement 시작일Input = driver.FindElement(By.Id("fromBidDt"));
            시작일Input.SendKeys(최근5일날짜);

            // 검색 클릭
            IWebElement 검색Button = driver.FindElement(By.XPath("//*[@id=\'searchForm\']/div/fieldset[1]/ul/li[4]/dl/dd[3]/a"));
            검색Button.Click();

            Thread.Sleep(5000);
            // 데이터 가져오기
            driver.SwitchTo().Frame(driver.FindElement(By.XPath("//frame[@name='sub']")));
            driver.SwitchTo().Frame(driver.FindElement(By.XPath("//frame[@name='main']")));

            IWebElement table = driver.FindElement(By.CssSelector(".table_list_tbidTbl"));

            var rows = table.FindElements(By.TagName("tr"));

            using (var package = new ExcelPackage(엑셀파일))
            {
                ExcelWorksheet worksheet;
                int rowIndex = 0;

                if (엑셀파일.Exists)
                {
                    worksheet = package.Workbook.Worksheets["Sheet1"];

                    rowIndex = worksheet.Dimension?.Rows + 1?? 2;
                }
                else
                {
                    worksheet = package.Workbook.Worksheets.Add("Sheet1");

                    worksheet.Cells[1, 1].Value = "공고명";
                    worksheet.Cells[1, 2].Value = "검색 키워드";
                    worksheet.Cells[1, 3].Value = "공고 기관";
                    worksheet.Cells[1, 4].Value = "수요 기관";
                    worksheet.Cells[1, 5].Value = "입력 일시";
                    worksheet.Cells[1, 6].Value = "검색 일시";
                    rowIndex = 2;
                }



                // 기존 엑셀 파일에 데이터 추가
                foreach (var row in rows.Skip(1)) // Skip the header row
                {
                    var columns = row.FindElements(By.TagName("td"));
                    DateTime 현재시각 = DateTime.Now;

                    // 공고명(3번째 열)
                    string 공고명 = columns[3].Text;
                    // 공고 기관(4번째 열)
                    string 공고기관 = columns[4].Text;
                    // 수요 기관(5번째 열)
                    string 수요기관 = columns[5].Text;
                    // 입력 일시(7번째 열)
                    string 입력일시 = columns[7].Text;
                    // 검색 일시(현재 시각)
                    string 검색일시 = worksheet.Cells[rowIndex, 6].Value?.ToString() ?? 현재시각.ToString("yyyy-MM-dd HH:mm");

                    // 데이터 추가
                    worksheet.Cells[rowIndex, 1].Value = 공고명;
                    worksheet.Cells[rowIndex, 2].Value = 키워드;
                    worksheet.Cells[rowIndex, 3].Value = 공고기관;
                    worksheet.Cells[rowIndex, 4].Value = 수요기관;
                    worksheet.Cells[rowIndex, 5].Value = 입력일시;
                    worksheet.Cells[rowIndex, 6].Value = 검색일시;

                    rowIndex++;
                }

                package.Save();
            }

        }
    }
}
