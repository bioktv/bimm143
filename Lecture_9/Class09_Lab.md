Class09\_Lab
================
Kimberly
2/4/2020

<https://bioboot.github.io/bimm143_W20/class-material/lab-8-bimm143.html>

``` r
# takes the first column and gets rid of the variable name "X"
x <- read.csv("UK_foods.csv", row.names = 1)
x
```

    ##                     England Wales Scotland N.Ireland
    ## Cheese                  105   103      103        66
    ## Carcass_meat            245   227      242       267
    ## Other_meat              685   803      750       586
    ## Fish                    147   160      122        93
    ## Fats_and_oils           193   235      184       209
    ## Sugars                  156   175      147       139
    ## Fresh_potatoes          720   874      566      1033
    ## Fresh_Veg               253   265      171       143
    ## Other_Veg               488   570      418       355
    ## Processed_potatoes      198   203      220       187
    ## Processed_Veg           360   365      337       334
    ## Fresh_fruit            1102  1137      957       674
    ## Cereals                1472  1582     1462      1494
    ## Beverages                57    73       53        47
    ## Soft_drinks            1374  1256     1572      1506
    ## Alcoholic_drinks        375   475      458       135
    ## Confectionery            54    64       62        41

*Q1. How many rows and columns are in your new data frame named `x`?
What R functions could you use to answer this question?*

``` r
# Complete the following code to find out how many rows and columns are in x
dim(x)
```

    ## [1] 17  4

Let’s explore the data with plots

``` r
barplot(as.matrix(x), beside=T, col=rainbow(nrow(x)))
```

![](Class09_Lab_files/figure-gfm/bar%20graph%20plotting%20pt.%20i-1.png)<!-- -->

``` r
# Try setting beside=FALSE in your barplot() code.
barplot(as.matrix(x), beside= F, col=rainbow(nrow(x)))
```

![](Class09_Lab_files/figure-gfm/bar%20graph%20plotting%20pt.%20ii-1.png)<!-- -->

``` r
# This plot is still not very helpful in comparison
```

*Q5: Generating all pairwise plots may help somewhat. Can you make sense
of the following code and resulting figure?* - *What does it mean if a
given point lies on the diagonal for a given plot?*

``` r
pairs(x, col=rainbow(10), pch=16)
```

![](Class09_Lab_files/figure-gfm/Q5:%20Pairwise%20plots-1.png)<!-- -->

``` r
# A5: first row: English vs. Wales, England vs. Scotland, England vs. N. Ireland
# ON line on diagonal = SAME proportions of the food between each country
# helpful but still tedious
```

## Principal Component Analysis (PCA) to the rescue with `prcomp()` function

``` r
# t takes the transpose (rotates the data so foods are in cols instead)
pca <- prcomp(t(x))
pca
```

    ## Standard deviations (1, .., p=4):
    ## [1] 3.241502e+02 2.127478e+02 7.387622e+01 4.188568e-14
    ## 
    ## Rotation (n x k) = (17 x 4):
    ##                              PC1          PC2         PC3          PC4
    ## Cheese              -0.056955380 -0.016012850 -0.02394295 -0.691718038
    ## Carcass_meat         0.047927628 -0.013915823 -0.06367111  0.635384915
    ## Other_meat          -0.258916658  0.015331138  0.55384854  0.198175921
    ## Fish                -0.084414983  0.050754947 -0.03906481 -0.015824630
    ## Fats_and_oils       -0.005193623  0.095388656  0.12522257  0.052347444
    ## Sugars              -0.037620983  0.043021699  0.03605745  0.014481347
    ## Fresh_potatoes       0.401402060  0.715017078  0.20668248 -0.151706089
    ## Fresh_Veg           -0.151849942  0.144900268 -0.21382237  0.056182433
    ## Other_Veg           -0.243593729  0.225450923  0.05332841 -0.080722623
    ## Processed_potatoes  -0.026886233 -0.042850761  0.07364902 -0.022618707
    ## Processed_Veg       -0.036488269  0.045451802 -0.05289191  0.009235001
    ## Fresh_fruit         -0.632640898  0.177740743 -0.40012865 -0.021899087
    ## Cereals             -0.047702858  0.212599678  0.35884921  0.084667257
    ## Beverages           -0.026187756  0.030560542  0.04135860 -0.011880823
    ## Soft_drinks          0.232244140 -0.555124311  0.16942648 -0.144367046
    ## Alcoholic_drinks    -0.463968168 -0.113536523  0.49858320 -0.115797605
    ## Confectionery       -0.029650201 -0.005949921  0.05232164 -0.003695024

``` r
summary(pca)
```

    ## Importance of components:
    ##                             PC1      PC2      PC3       PC4
    ## Standard deviation     324.1502 212.7478 73.87622 4.189e-14
    ## Proportion of Variance   0.6744   0.2905  0.03503 0.000e+00
    ## Cumulative Proportion    0.6744   0.9650  1.00000 1.000e+00

To read the summary data: - “Approximately 67% of the variance in the
data is accounted for by the first principal component (”Proportion of
Variance), and approximately 97% is accounted for in total by the first
two principal components (Cumulative Proportion)."

Check the attributes/components of the output w/ `attributes()`

``` r
attributes(pca)
```

    ## $names
    ## [1] "sdev"     "rotation" "center"   "scale"    "x"       
    ## 
    ## $class
    ## [1] "prcomp"

*Q7. Complete the code below to generate a plot of PC1 vs PC2. The
second line adds text labels over the data points.*

``` r
# Plot PC1 vs PC2
plot(pca$x[, 1], pca$x[, 2], xlab="PC1", ylab="PC2", xlim=c(-270,500))
text(pca$x[,1], pca$x[,2], colnames(x), 
     col=c("grey", "red", "blue", "orange"))
```

![](Class09_Lab_files/figure-gfm/Q7:%20Plotting%20PCA%20data-1.png)<!-- -->
