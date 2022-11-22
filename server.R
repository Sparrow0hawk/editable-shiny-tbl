library(shiny)
library(readxl)

server <- function(input, output) {

  output$contents <- renderDT({

    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, head of that data file by default,
    # or all rows if selected, will be shown.

    req(input$file1)

    # retrieve file extension
    file_ext <- extract_ext(input$file1$datapath)

    # when reading semicolon separated files,
    # having a comma separator causes `read.csv` to error
    tryCatch(
      {
        if (file_ext == "csv") {

            df <- read.csv(input$file1$datapath,
                    header = input$header,
                    sep = input$sep,
                    quote = input$quote)

        } else if (file_ext == "xlsx") {

            df <- read_excel(input$file1$datapath)
        } else {
            stop(safeError(paste0("Invalid file type uploaded: {",file_ext,"} only `csv` and `xlsx` supported.")))
        }
      },
      error = function(e) {
        # return a safeError if a parsing error occurs
        stop(safeError(e))
      }
    )
    return(df)
  }, editable = 'all')

}