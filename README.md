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
but some patterns that arise are from the origin, the time of year
(month), and the airline carrier. It can be seen that most patterns show
how delay time tends to go up during the evening and late hours of
intended departure time, especially between 3:00 and 8:00 pm, trailing
down just a little bit after 8:00 pm.

Overall, at each origin airport, the delay time trends upward as the
time of day increases. The majority of the average delay times do tend
to stay under 20 minutes, which is not exceptionally long, with the
exception of EWR though, which tends to have even longer delays in the
afternoon and evening hours of the day than the other airports.

Sorting the data by month can give indications about what the weather is
like according to season or if it is a time of the year with holidays.
Delay times in the late and evening hours of warmer months and seasons
like spring and summer, and especially June and July, are much higher
than in other months, which can be attributed to more flights and travel
can occur. Another spike in evening and late delays can be seen in
December, which can attributed to more traveling with the holidays, but
with poorer weather conditions, as well. Winter months might show lower
delay times though because there are more of these flights being
canceled due to inclement weather. Most hours of the day though, again,
tend to stay under 20 minutes, with the exception of some evening hours.

Regarding the airline carrier, the delay times for airlines that have a
small number of flights, may have much longer delay times for any
particular hour, such as with OO and YV. There are some higher delay
times in evening hours, such as EV, FL, UA, or WN, do trend a little bit
higher, but the majority of the day at each airline stays under 20-25
minutes, but trending upwards again towards the later hours.

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
  summarise(mean_dep_delay = mean(dep_delay, na.rm = TRUE),
            mean_arr_delay = mean(arr_delay, na.rm = TRUE)) %>% 
  ggplot(aes(x = hour)) +
           geom_point(aes(y=(mean_dep_delay), color= "mean depature delay"), alpha =0.35)  + 
           geom_point(aes(y=(mean_arr_delay),  color="mean arrival delay"), alpha =0.35) +
           ggtitle("Average Delay by the Hour According to Origin") +
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
           ggtitle("Average Delay by the Hour According to the Month") +
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
  group_by(hour, carrier) %>% 
  summarise(mean_dep_delay = mean(dep_delay, na.rm = TRUE),
            mean_arr_delay = mean(arr_delay, na.rm = TRUE)) %>% 
  ggplot(aes(x = hour)) +
           geom_point(aes(y=(mean_dep_delay), color= "mean depature delay"), alpha =0.35)  + 
           geom_point(aes(y=(mean_arr_delay),  color="mean arrival delay"), alpha =0.35) +
           ggtitle("Average Delay by the Hour According to Airline Carrier") +
           xlab('hour') +
           ylab('mean delay (minutes)') +
           facet_wrap(~carrier)
```

    ## `summarise()` has grouped output by 'hour'. You can override using the `.groups` argument.

``` r
by_carrier
```

    ## Warning: Removed 1 rows containing missing values (geom_point).
    
    ## Warning: Removed 1 rows containing missing values (geom_point).

![](README_files/figure-gfm/Pattern%203:%20Airline%20Carrier-1.png)<!-- -->
