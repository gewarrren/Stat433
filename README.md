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

## Pattern 1: Origin

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

# Looking at mean delay of flights according to origin by the hour (time of day)

by_origin = flights %>% 
  group_by(hour, origin) %>% 
  summarise(count = n(),
            mean_dep_delay = mean(dep_delay, na.rm = TRUE),
            mean_arr_delay = mean(arr_delay, na.rm = TRUE)) %>% 
  ggplot(aes(x = hour)) +
           geom_point(aes(y=(mean_dep_delay), color= "mean depature delay"), alpha =0.35)  + 
           geom_point(aes(y=(mean_arr_delay),  color="mean arrival delay"), alpha =0.35) +
           xlab('hour') +
           ylab('mean delay (minutes)') + 
          facet_wrap(~origin)
```

    ## `summarise()` has grouped output by 'hour'. You can override using the `.groups` argument.

``` r
by_origin
```

    ## Warning: Removed 1 rows containing missing values (geom_point).
    
    ## Warning: Removed 1 rows containing missing values (geom_point).

![](README_files/figure-gfm/Pattern%201:%20Origin-1.png)<!-- -->

## Pattern 2: Month

``` r
# Looking at mean delay times according to month by the hour (time of day)

by_month = flights %>% 
  group_by(hour, month) %>% 
  summarise(mean_dep_delay = mean(dep_delay, na.rm = TRUE),
            mean_arr_delay = mean(arr_delay, na.rm = TRUE)) %>% 
  ggplot(aes(x = hour)) +
           geom_point(aes(y=(mean_dep_delay), color= "mean depature delay"), alpha =0.35)  + 
           geom_point(aes(y=(mean_arr_delay),  color="mean arrival delay"), alpha =0.35) +
           xlab('hour') +
           ylab('mean delay (minutes)') + 
          facet_wrap(~month)
```

    ## `summarise()` has grouped output by 'hour'. You can override using the `.groups` argument.

``` r
by_month
```

    ## Warning: Removed 1 rows containing missing values (geom_point).
    
    ## Warning: Removed 1 rows containing missing values (geom_point).

![](README_files/figure-gfm/Pattern%202:%20Month-1.png)<!-- -->

## Pattern 3: Airline Carrier

``` r
# Looking at the mean delay times according to carrier by the hour (time of day)


by_carrier = flights %>% 
  filter(!(arr_delay > 120)) %>% 
  group_by(hour, carrier) %>% 
  summarise(mean_dep_delay = mean(dep_delay, na.rm = TRUE),
            mean_arr_delay = mean(arr_delay, na.rm = TRUE)) %>% 
  ggplot(aes(x = hour)) +
           geom_point(aes(y=(mean_dep_delay), color= "mean depature delay"), alpha =0.35)  + 
           geom_point(aes(y=(mean_arr_delay),  color="mean arrival delay"), alpha =0.35) +
           xlab('hour') +
           ylab('mean delay (minutes)') +
           facet_wrap(~carrier)
```

    ## `summarise()` has grouped output by 'hour'. You can override using the `.groups` argument.

``` r
by_carrier
```

![](README_files/figure-gfm/Pattern%203:%20Airline%20Carrier-1.png)<!-- -->
