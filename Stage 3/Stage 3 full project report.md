<!--StartFragment-->

## **Data Analysis Report on Cholera Outbreaks since 1949**

This report contains the insights generated from the WHO Cholera Outbreak Data since 1949.

**Author (@slack):** Chijioke C. Uhegwu (@Chijioke001)

**WHO Datasets:** [hackbio-cancer-internship/Stage 3/Data at main · ChijiokeUhegwu/hackbio-cancer-internship (github.com)](https://github.com/ChijiokeUhegwu/hackbio-cancer-internship/tree/main/Stage%203/Data)

**Visualizations:** [hackbio-cancer-internship/Stage 3/Visualizations at main · ChijiokeUhegwu/hackbio-cancer-internship (github.com)](https://github.com/ChijiokeUhegwu/hackbio-cancer-internship/tree/main/Stage%203/Visualizations)

**R scripts:** [hackbio-cancer-internship/Stage 3/Stage-3.R at main · ChijiokeUhegwu/hackbio-cancer-internship (github.com)](https://github.com/ChijiokeUhegwu/hackbio-cancer-internship/blob/main/Stage%203/Stage-3.R)

### **Data Preparation and Cleaning**

The WHO Cholera outbreak Data (.csv files) were downloaded from the WHO website and loaded into Rstudio. The most unique and most repeated values were identified to understand the structure of the dataset and assess the distribution of key variables. A detailed inspection of missing values across the different columns was done although no duplication or missing values. The data types were adjusted to integers to ensure numerical consistency in the data.

### **Key Insights and Summary**

Interactive charts for enhanced understanding of the data can be found in the R scripts attached above.

**1.0 Reported Cases of Cholera**

**1.1 Top 5 countries with the highest reported cholera cases**

India reported the most cases (1.363M).

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeA-UCpBvemOuQvbxT67kpOJD1b087C3KqY3AX9YO6Bu1h0DxU5JOOZra26mxwwSx1OXO-pBVVVXz7QDry0xsktnF6jb11doJVqrIugXU2iBDjpcXu1iCfR_XgHjKvu1bmhNMtiHEMnfIe_MNDsITKZbiC-?key=dle8xYZD3vzQoFjFDDI6lw)

**1.2 Top 50 Countries with the lowest reported cholera cases**

Below is the visualization for the country with the lowest reported cholera cases since 1949.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXd3KnNH6Jd00mT5uzP_NXSU34X8nO1vI92AbuCxugwMZck4WoeGERR6iBz9mkkOXyXwVgzwtjH9HxyVnKQ6sRbNUwZsaRQU9B6aNjGxkH1Ebo6rRhyVov6MHevmpS2TRvw6cijIGjcljxgb9PMI7vaZMUbx?key=dle8xYZD3vzQoFjFDDI6lw)

**1.3 Number of cholera cases reported by country**

The number of cholera cases that has been reported by different country is shown below:

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfLhm8cIrge743BwXeguYihqqj-IDTI3ZCIVCGsdL-gUHMr99QAR4tMMYM3wPKCWz05WOzjHgN0ZkzS9DEcw-29a4s7Il8yP71JP7-keHGOMqd92gNSAJXD4i5cGLVuLXjZ6OW81n67fLt8G86y6LBAJkdv?key=dle8xYZD3vzQoFjFDDI6lw)

**1.4 Trends in reported cholera cases over time**

The trend in reported cholera cases shows an increase in reported cases from 1950, and a spike in 1990, followed by a decline in subsequent years. Another significant spike was observed in 2010 with a decline in subsequent years.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfugSgQsDKL8yjGp5UTuupI6QzuNkAHq72-TOEdfOcNvtHdlifd3c5QlGVabCtzfz0qxUkEOlM02R99oXwErlGzp4EEgfFz4lCA-9Ki4Znx3xGKEv0Yzc70CraWoHzoaMAZzNRgCDYJvWyxVmwo6P8UuzKp?key=dle8xYZD3vzQoFjFDDI6lw)

**2.0 Reported Deaths from Cholera**

**2.1 Top 5 countries with the highest reported cholera deaths**

India recorded the most deaths from cholera (509.438k).

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXc7dExnxr82Su2OWGMcenqlPeNyhlztm4qWLH0Bzp3W2Oo9n2IvbP9knhkDLSzoQJvsMx_Zc_NguEPJy08Mj-8hqwXryzJrcvV-cZpFkh5jl1lkdO0D-k25JsBkjTbpMxrIn8FuD3cP92vIGU35JxCbzpw?key=dle8xYZD3vzQoFjFDDI6lw)

**2.2 Top 50 Countries with the lowest reported deaths from cholera** 

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXe20YU3EXwo3o44_SnrL5YvWOVGrfqf3hULzsSJST4bUqlsO1j_qwAykHz4e9dn40jEFmq261dnIcKfn1huO0_pQMs7eJPS-ko9sn4453nE6r7UAE0lr6ZUiP-Au_sYY1tKMhFma7NUalPHSRaymFIBaXxf?key=dle8xYZD3vzQoFjFDDI6lw)

**2.3 Number of cholera deaths reported by country**

As shown below, India reported the most deaths since 1949.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeBcb9g5HHHcf1BuZOIZWu_PSObKYfQCv8HGNouIkRWXCCMB_RypYlY3cRqPPs5UJdqkmx3mbkoVceKLavmY3rFVruIE99BHiYoLzOT2e72Rp2jwPAXQIdvtHQcdenh8fgvOBxtFzAnKAJ4r0jO5o5HLycQ?key=dle8xYZD3vzQoFjFDDI6lw)

**2.4 Trends in reported cholera deaths over time**

The highest spike was observed between 1950-1955 with subsequent decline in the following years. 

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXeW1RoEJJKaU_ih9GyM2qg4WjkxdwJ696WRkkWirBZ6gtcU4-V_EGcTBRgK1w0AV2hQsbIGPMLOMHFK27vDuL9CYk-8lyJxEgrpolyAH_JfMr5_5vyxhT5e8_iHGgAjqFAVkJ_VFf2D8zIxT7DrFdJ_SmvL?key=dle8xYZD3vzQoFjFDDI6lw)

**3.0 Reported Cholera Case fatality rates** 

**3.1 Top 5 countries with the highest reported cholera cases**

Bangladesh reported the highest case fatality rates (1201).

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXend0rT-DTl342jLMMyTKxwv9EcVqLfdmLogZw0dMAIWKcSm-KEqZH_MP6UQ2tGzd1T2K-iCCCtxw98i-SWdSdls9L2h0NCSQXz1aaN55AyEuLVBPYLx1LoZA6iH0e0nhrxons0krTwZfHCKVfvhuvP8Kc?key=dle8xYZD3vzQoFjFDDI6lw)

**3.2 Top 50 Countries with the lowest reported cholera case fatality rates**

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXe9nUiwXVLE30DDHIg0C9xDJjX_KmjJItd8e0JS7T_dzfZZlUc43E0q851cm3RR7UOE8BHei9ufhNliDhF8R8wXDF1KxdLezaQ_Fn__Pki5H7r6D74uRt5PJ3LHpBjFmgm1cCqE4v8PPj94RFQn4wGzD6zv?key=dle8xYZD3vzQoFjFDDI6lw)

**3.3 Number of cholera case fatality rates reported by country**

Belarus reported the most case fatality rates

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfiOurnivvcCD96OZ7RrYtP7mOdR4HkXAJ5ayUc578vMI9wDsglIceYyM1RLsIr9QoVdIH1fJ4243hBNu9fZ_4UTzGIveCogzSsq4_phu_TgNmq57I8rzHfM4FZRJJDexh1q6T89F6m2x9hnjYGZjF_1bGD?key=dle8xYZD3vzQoFjFDDI6lw)

**2.4 Trends in reported cholera case fatality rates over time**

The highest spike was observed between 1990-2000.

![](https://lh7-rt.googleusercontent.com/docsz/AD_4nXfTzTfOoR-UTxMTOtdsmV9sq9odlfyVQkI-w7m1k-990l9URxaqBjINWNsfoCn7gWiJ2fHPBWaURX8rnCa2Umq7S391Y8RcJCguAwdTFA0-gTSQqvVy66iP16kw_l4z3_FXfcY76T01k2hqSt2wLoYZc1Hf?key=dle8xYZD3vzQoFjFDDI6lw)

### **Conclusion:**

This report presents significant findings from the WHO Cholera Outbreak Data, shedding light on important trends in cholera case numbers, deaths, and case fatality rates worldwide since 1949. The analysis highlights the persistent threat of cholera, especially in high-burden regions such as India, highlighting the need for robust public health measures to prevent future outbreaks. 




<!--EndFragment-->
