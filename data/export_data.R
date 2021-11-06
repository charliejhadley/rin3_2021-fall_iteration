library(tidyverse)
library(gapminder)

export_gapminder_year <- function(year){
  
  gapminder %>% 
    filter(year == year) %>% 
    write_csv(file.path("data", str_glue("gapminder_{year}.csv")))
  
  
}

gapminder %>% 
  pull(year) %>%
  unique() %>% 
  walk(~export_gapminder_year(.x))
