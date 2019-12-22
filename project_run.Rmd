---
title: "R Notebook"
output: html_notebook
---

# OBJECTIVE

Preload and initial imperfection shape of grillages generated to explore effects on ultimate strength under joint US-Canada program examining ultimate strength and fatigue of degraded ship structures.


# GRILLAGE TEST MACHINE

NSWCCD fixture designed to accommodate large-scale grillages of up to 24 feet (7.32 m) in length and 8 feet (2.44 m) in width. 
Longitudinal loads of up to 5 million pounds (22.2 MN) in tension or compression with $\pm$ 6 inches of displacement.
Transverse loads of up to 1 million pounds in tension or compression over the middle 8 feet of the specimen, with $\pm$ 3 inches (152 mm) of displacement.
Lateral pressure of up to 25 psi (172 kPa) on either the plating or stiffener side of the specimen. 
Machine compliance determined to be 4.6399 10$^{−5}$  in/kip (0.000265 mm/kN)

See Figure 1 for the grillage test fixture.



```{r}
library(jpeg)

?readJPEG()

img <- readJPEG("Grillage.jpeg", native = TRUE)


if(exists("rasterImage")){
      plot(1:2, type='n')
      rasterImage(img,1,1,2,2)
}
```
Figure 1. Grillage test fixture.


FIXTURE CONFIGURATION

Longitudinal end conditions were configured as clamped.  
Only longitudinal actuators utilized, no transverse or lateral loads series.
Tie downs along long end of panel to prevent vertical motion.

Grillage specimen used for the experiment can be shown in Figure 2 and 3.

```{r}
library(jpeg)

?readJPEG()

img <- readJPEG("Grillage_specimen.jpeg", native = TRUE)


if(exists("rasterImage")){
      plot(1:2, type='n')
      rasterImage(img,1,1,2,2)
}
```
Figure 2. Grillage specimen in dimension.



```{r}
library(jpeg)

?readJPEG()

img <- readJPEG("Grillage_experiment.jpeg", native = TRUE)


if(exists("rasterImage")){
      plot(1:2, type='n')
      rasterImage(img,1,1,2,2)
}
```
Figure 3.Grillage specimen in experiment.


The scenarios of grillage based on the preload and initial imperfection shape. The grillage are appied with and without preload as well the initial imperfections are varied in 4 types based on the imperfection amplitude. Then, the grillage is compressed so that the buckling behavior will be occur during analysis. The results of load shortening curve in each scenario can be shown in Table 1. While the plot of curves can be shown in figure 4.

Table 1. Load shortening curve of grillage.
```{python}
from openpyxl import load_workbook
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

for i in range(1,5):
   wb = load_workbook(filename='Result_00' + str(i) + '.xlsx', data_only=True)
   ws = wb['xyToExcel']
   data_rows = []
   for row in ws['A1':'C42']:
     data_cols = []
     for cell in row:
         data_cols.append(cell.value)
     data_rows.append(data_cols)
   df = pd.DataFrame(data_rows)
   my_columns = ["DISPL IMP = " + str(i), "PRELOAD", "NON-PRELOAD"]
   df.columns = my_columns
   print (df)
    
```





```{python}
from openpyxl import load_workbook
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

# Read the Tensile test 1 
wb1 = load_workbook(filename='Result_001.xlsx', data_only=True)

ws1 = wb1['xyToExcel']

# Read the cell values into a list of lists
data_rows1 = []
for row in ws1['A1':'C42']:
    data_cols1 = []
    for cell in row:
        data_cols1.append(cell.value)
    data_rows1.append(data_cols1)

# Transform into dataframe
df1 = pd.DataFrame(data_rows1)

# Read the Tensile test 2
wb2 = load_workbook(filename='Result_002.xlsx', data_only=True)

ws2 = wb2['xyToExcel']

# Read the cell values into a list of lists
data_rows2 = []
for row in ws2['A1':'C42']:
    data_cols2 = []
    for cell in row:
        data_cols2.append(cell.value)
    data_rows2.append(data_cols2)

# Transform into dataframe
import pandas as pd
df2 = pd.DataFrame(data_rows2)

# Read the Tensile test 3
wb3 = load_workbook(filename='Result_003.xlsx', data_only=True)

ws3 = wb3['xyToExcel']

# Read the cell values into a list of lists
data_rows3 = []
for row in ws3['A1':'C42']:
    data_cols3 = []
    for cell in row:
        data_cols3.append(cell.value)
    data_rows3.append(data_cols3)

# Transform into dataframe
df3 = pd.DataFrame(data_rows3)

# Read the Tensile test 4
wb4 = load_workbook(filename='Result_004.xlsx', data_only=True)

ws4 = wb4['xyToExcel']

# Read the cell values into a list of lists
data_rows4 = []
for row in ws4['A1':'C42']:
    data_cols4 = []
    for cell in row:
        data_cols4.append(cell.value)
    data_rows4.append(data_cols4)

# Transform into dataframe
df4 = pd.DataFrame(data_rows4)

fig, axs = plt.subplots(2, 2)
axs[0, 0].plot(df1[0], df1[1], 'tab:blue')
axs[0, 0].plot(df1[0], df1[2], 'tab:blue')
axs[0, 0].set_title('IMP 1')
axs[0, 1].plot(df2[0], df2[1], 'tab:orange')
axs[0, 1].plot(df2[0], df2[2], 'tab:orange')
axs[0, 1].set_title('IMP 2')
axs[1, 0].plot(df3[0], df3[1], 'tab:green')
axs[1, 0].plot(df3[0], df3[2], 'tab:green')
axs[1, 0].set_title('IMP 3')
axs[1, 1].plot(df4[0], df4[1], 'tab:red')
axs[1, 1].plot(df4[0], df4[2], 'tab:red')
axs[1, 1].set_title('IMP 4')

for ax in axs.flat:
    ax.set(xlabel='Displacement', ylabel='Stress (MPa)')

# Hide x labels and tick labels for top plots and y ticks for right plots.
for ax in axs.flat:
    ax.label_outer()
plt.savefig('Result.jpeg')
plt.show()

```


```{r}
library(jpeg)

?readJPEG()

img <- readJPEG("Result.jpeg", native = TRUE)


if(exists("rasterImage")){
      plot(1:2, type='n')
      rasterImage(img,1,1,2,2)
}
```
Figure 4. Load shortening curve of grillage


CONCLUSION

Based on the results, it can be drawn some conclusions related to the experiment anlaysis. First, the effect of preload slightly influences the different of load shortening curve especially for the small initial imperfection. Second, the bigger of initial imperfection, the more difference of load shortening curves. So, it might consider the initial imperfection for the high amplitude.



