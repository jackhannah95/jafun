# jafun 0.2.3 (2021-10-04)

- Fixed a bug in `day_to_num()` which prevented it from working correctly when supplied with a vector containing multiple instances of the same day of the week.
- `jafun` no longer imports [`janitor`](http://sfirke.github.io/janitor/), but does now import [`stringr`](https://stringr.tidyverse.org/).

# jafun 0.2.2 (2021-06-11)

- Rewrote `days_of_week()` and fixed a bug in its implementation which allowed non-logical values to be supplied to its `abbr` argument ([#3](https://github.com/jackhannah95/jafun/issues/3)).

# jafun 0.2.1 (2020-11-18)

- Fixed a test for `source_scripts()` that passed but for the wrong reason.

# jafun 0.2.0 (2020-11-11)

- New functions added: `prop_missing()` and `source_scripts()`.

# jafun 0.1.1 (2020-07-14)

- `day_to_num()` now has an `ignore_case` argument which defaults to `TRUE`.
- `jafun` now imports [`janitor`](http://sfirke.github.io/janitor/). 

# jafun 0.1.0 (2020-06-26)

- Initial package release.
- `day_to_num()`, `days_of_week()` and `n_day()` functions added.
