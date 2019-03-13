Workout 1
================
Jenny Wu

Introduction
============

The Golden State Warriors are a professional American basketball team based in the San Francisco Bay Area. They currently hold several NBA records and in the past decade in particular, they have experienced a lot of success, much of which can be attributed to some of their star players whose shot statistics will be the focus of our analysis here.

We will be specifically looking at the players Andre Iguodala, Draymond Green, Kevin Durant, Klay Thompson, and Stephen Curry and the data of their shots from the 2016 season.

Basketball Positions
--------------------

### Point guard

-   responsible for directing plays
-   lead team in assists
-   play-maker

### Shooting guard

-   usually prolific from three-point range

### Small forward

-   usually good long range shooters
-   most versatile position

### Power forward

-   often most versatile scorer (in terms of distance from basket)

### Center

-   usually plays near baseline or close to basket

 

Players
=======

Andre Iguodala
--------------

-   Shooting guard/Small forward

<img src="../images/andre-iguodala-shot-chart.png" width="80%" style="display: block; margin: auto;" />

Draymond Green
--------------

-   Power forward

<img src="../images/draymond-green-shot-chart.png" width="80%" style="display: block; margin: auto;" />

Kevin Durant
------------

-   Small forward

<img src="../images/kevin-durant-shot-chart.png" width="80%" style="display: block; margin: auto;" />

Klay Thompson
-------------

-   Shooting guard

### Records

-   NBA regular season record for most points scored in a quarter (37)
-   NBA regular season record for most three-pointers made in a game (14)
-   NBA record for most three-pointers made in a single playoffs (98 tied with Stephen Curry)
-   NBA playoff record for most three-pointers made in a game (11)

<img src="../images/klay-thompson-shot-chart.png" width="80%" style="display: block; margin: auto;" />

Stephen Curry
-------------

-   Point guard

### Records

-   NBA regular season record for made three-pointers (402)
-   NBA record for most three-pointers made in a single playoffs (98 - tied with Klay Thompson)
-   NBA Finals record for most three-pointers made in a game (9)
-   NBA record for most consecutive regular season games with a made three-pointer (157)
-   NBA record for most consecutive playoff games with a made three-pointer (90)
-   NBA record for most points scored in an overtime period (17)
-   Warriors franchise leader in three-point field goals made

<img src="../images/stephen-curry-shot-chart.png" width="80%" style="display: block; margin: auto;" />

 

Comparing the Players' Effective Shooting Percentage
====================================================

Two-pointer statistics
----------------------

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Andre Iguodala   210   134     0.638
    ## 2 Kevin Durant     643   390     0.607
    ## 3 Stephen Curry    563   304     0.540
    ## 4 Klay Thompson    640   329     0.514
    ## 5 Draymond Green   346   171     0.494

Three-pointer statistics
------------------------

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Klay Thompson    580   246     0.424
    ## 2 Stephen Curry    687   280     0.408
    ## 3 Kevin Durant     272   105     0.386
    ## 4 Andre Iguodala   161    58     0.360
    ## 5 Draymond Green   232    74     0.319

Overall statistics
------------------

    ## # A tibble: 5 x 4
    ##   name           total  made perc_made
    ##   <fct>          <int> <int>     <dbl>
    ## 1 Kevin Durant     915   495     0.541
    ## 2 Andre Iguodala   371   192     0.518
    ## 3 Klay Thompson   1220   575     0.471
    ## 4 Stephen Curry   1250   584     0.467
    ## 5 Draymond Green   578   245     0.424

Comparing player shot charts
----------------------------

<img src="../images/gsw-shot-charts.png" width="80%" style="display: block; margin: auto;" />

Summary
=======

Unsurprisingly, Thompson and Curry, both of whom hold records for their three-pointers, have the greatest consistency when it comes to making their three-pointer shots. However, in terms of both their two-pointer shots and just their overall percentage for the shots that they make, their statistics don't compare quite as well to the rest of the players.

That being said, a closer inspection of the data makes it clear that their success doesn't like inherently in any sort of godlike consistency, but rather, as the incredible density of points on their shot charts suggests, they simply take way more shots than some of their other teammates and as a result, the number of shots they make--and in turn the amount of points they score--is also much greater.
