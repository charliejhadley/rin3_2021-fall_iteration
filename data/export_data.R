library(tidyverse)
library(gapminder)

export_gapminder_year <- function(export_year){
  
  gapminder %>% 
    filter(year == export_year) %>% 
    write_csv(file.path("data", str_glue("gapminder_{export_year}.csv")))
  
  
}

gapminder %>% 
  pull(year) %>%
  unique() %>% 
  walk(~export_gapminder_year(.x))
