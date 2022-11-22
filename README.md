# Editable DT in Shiny

This repository is a proof-of-concept example of reading in a tabular data file into a Shiny application and 
allowing it to be editable through the [`DT`](https://rstudio.github.io/DT) package.

## Usage

You can test this Shiny app locally by installing it's dependencies using [`renv`]()

```bash
$ cd editable-shiny-tbl

$ R -e 'install.packages("renv");renv::restore();'

$ R -e 'shiny::runApp(port = 3838)'

```

This will start the Shiny app locally at at http://127.0.0.1:3838/