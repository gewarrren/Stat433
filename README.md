Stat433: HW Week 4
================
Georgia Warren
10/5/2021

Link to github: <https://github.com/gewarrren/gewarrren.git>

## Summary:

The delay times for flights can depend on a number of factors, but based
on this data set, we can look to see what flights have longer delay
times by the time of day.

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
# Viewing which hours of the day (time of day) have the largest average delays

delay_flights = flights %>% 
  group_by(hour) %>% 
  filter(dep_delay > 0, arr_delay > 0) %>% 
  summarise(mean_dep_delay = mean(dep_delay, na.rm=TRUE),
            mean_arr_delay = mean(arr_delay, na.rm=TRUE)) %>%
  arrange(desc(mean_dep_delay), 
          desc(mean_arr_delay))

delay_flights
```

    ## # A tibble: 19 × 3
    ##     hour mean_dep_delay mean_arr_delay
    ##    <dbl>          <dbl>          <dbl>
    ##  1    19           64.3           61.8
    ##  2    20           61.6           58.5
    ##  3    21           59.5           56.3
    ##  4    18           58.6           59.4
    ##  5    17           58.0           60.9
    ##  6    16           56.6           58.4
    ##  7    22           51.9           51.0
    ##  8    15           50.1           52.7
    ##  9    14           48.1           52.0
    ## 10    23           45.2           43.5
    ## 11    10           44.5           45.8
    ## 12    13           44.1           46.1
    ## 13    11           43.8           44.9
    ## 14    12           42.3           43.1
    ## 15     9           41.0           42.0
    ## 16     8           40.3           43.0
    ## 17     6           35.8           37.8
    ## 18     7           35.8           38.1
    ## 19     5           24.3           26.9

``` r
# Looking at delay of flights by time of year (month)
```

``` r
# Looking at delay times according to destination by the hour (time of day)
```
