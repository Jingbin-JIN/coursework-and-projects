# Data analysis lab notebooks (Python)

Two lab notebooks from the course *데이터분석기초* (introductory data analysis, SungKyunKwan University), done in Google Colab with pandas, matplotlib and seaborn.

| Notebook | Content |
|---|---|
| `01_matplotlib_california_housing.ipynb` | matplotlib basics (line, bar, pie, histogram, scatter, box plots, subplots); exercises on the Colab `california_housing_train.csv` sample: sorting a DataFrame, stacked subplots, a longitude/latitude scatter plot coloured by median house value with a colour bar |
| `02_seaborn_iris_tips.ipynb` | pandas plotting and seaborn on the iris, flights and tips datasets: scatter/hist/box/joint/pair plots, pivot + heat map; exercises: joint plot of the housing data, `pairplot` by weekday on *tips*, a derived `tip_pct` column analysed by party size and by day, and a per-species heat map of the iris features |

The markdown cells and the cells marked `이론 … 예시` (theory examples) are the course's lab material; the cells under the `문제` (problem) headings are my answers. The notebooks expect the Colab environment (`sample_data/`, a mounted Google Drive for `iris.csv`, and the `fonts-nanum` install for Korean labels).

## Notes on this copy

In the second notebook three example cells had a stale `NameError` output from having been re-run before the seaborn import cell; `import seaborn as sns` was added to the package cell at the top and those three outputs were cleared. No answer cell was changed.
