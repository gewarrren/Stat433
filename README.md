Stat433: HW Week 4
================
Georgia Warren
10/5/2021

Link to github: <https://github.com/gewarrren/gewarrren.git>

## Summary:

Based on `flights` data set, we can look to see what flights have longer
delay times by the time of day. This shows that the hours in which delay
times are the longest are typically in the evening hours. The longer
delay times for flights at such hours can depend on a number of factors,
but some patterns that arise a

``` r
library(nycflights13)
library(dplyr)
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(ggplot2)

# Viewing which hours of the day (time of day) have the largest average delays

by_dest = flights %>% 
  group_by(hour, dest) %>% 
  summarise(count = n(),
            mean_dep_delay = mean(dep_delay, na.rm = TRUE),
            mean_arr_delay = mean(arr_delay, na.rm = TRUE)) %>% 
  ggplot(aes(x = hour)) +
           geom_point(aes(y=mean_dep_delay, color = "dep_delay"), alpha =0.35) + 
           geom_point(aes(y=mean_arr_delay, color = "arr_delay"), alpha =0.35) +
           xlab('hour') +
           ylab('mean delay (minutes)')
```

    ## `summarise()` has grouped output by 'hour'. You can override using the `.groups` argument.

## Pattern 1

``` r
# Looking at delay of flights by time of year (month)
```

``` r
# Looking at delay times according to destination by the hour (time of day)
```
