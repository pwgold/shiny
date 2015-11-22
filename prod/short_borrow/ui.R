library(shiny)
library(ggplot2)  # for the diamonds dataset

default_names = c('X.SYM', 'NAME', 'REBATERATE','FEERATE','AVAILABLE')
all_names = c('X.SYM','CUR','NAME','CON','ISIN','REBATERATE','FEERATE','AVAILABLE','X')

shinyUI(fluidPage(
  title = 'Short Borrow',
  sidebarLayout(
  # sidebarPanel(
    wellPanel(
     tags$style(type="text/css", '#leftPanel { width:200px; float:left;}'),
     id = "leftPanel",

    dateInput('date',
      label = 'Date input: yyyy-mm-dd',
      value = Sys.Date() - 2
    ),

     conditionalPanel(
        'input.dataset ==="australia"',
	checkboxGroupInput('show_vars_australia', 'Columns to show:',
                           all_names, selected = default_names)
      ),		   

      conditionalPanel(
        'input.dataset ==="austria"',
	checkboxGroupInput('show_vars_austria', 'Columns to show:',
                           all_names, selected = default_names)
      ),		   

      conditionalPanel(
        'input.dataset === "belgium"',
	checkboxGroupInput('show_vars_belgium', 'Columns to show:',
                           all_names, selected = default_names)
      ),

    conditionalPanel(
        'input.dataset === "british"',
	checkboxGroupInput('show_vars_british', 'Columns to show:',
                           all_names, selected = default_names)
      ),

    conditionalPanel(
        'input.dataset === "canada"',
	checkboxGroupInput('show_vars_canada', 'Columns to show:',
                           all_names, selected = default_names)
      ),

    conditionalPanel(
        'input.dataset === "dutch"',
	checkboxGroupInput('show_vars_dutch', 'Columns to show:',
                           all_names, selected = default_names)
      ),
   conditionalPanel(
        'input.dataset === "france"',
	checkboxGroupInput('show_vars_france', 'Columns to show:',
                           all_names, selected = default_names)
      ),

    conditionalPanel(
        'input.dataset === "hongkong"',
	checkboxGroupInput('show_vars_hongkong', 'Columns to show:',
                           all_names, selected = default_names)
      ),
          conditionalPanel(
        'input.dataset === "india"',
	checkboxGroupInput('show_vars_india', 'Columns to show:',
                           all_names, selected = default_names)
      ),

    conditionalPanel(
        'input.dataset === "italy"',
	checkboxGroupInput('show_vars_italy', 'Columns to show:',
                           all_names, selected = default_names)
      ),
    

    conditionalPanel(
        'input.dataset === "usa"',
	checkboxGroupInput('show_vars_usa', 'Columns to show:',
                           all_names, selected = default_names)
      )
    ),

    mainPanel(
       verbatimTextOutput("headerText"), # debugging

      tabsetPanel(
        id = 'dataset',
        tabPanel('australia', DT::dataTableOutput('australiaTable')),
	tabPanel('austria', DT::dataTableOutput('austriaTable')),
	tabPanel('belgium', DT::dataTableOutput('belgiumTable')),
        tabPanel('british', DT::dataTableOutput('britishTable')),
        tabPanel('canada', DT::dataTableOutput('canadaTable')),
	tabPanel('dutch', DT::dataTableOutput('dutchTable')),
	tabPanel('france', DT::dataTableOutput('franceTable')),
	tabPanel('hongkong', DT::dataTableOutput('hongkongTable')),
	tabPanel('india', DT::dataTableOutput('indiaTable')),
	tabPanel('italy', DT::dataTableOutput('italyTable')),
	tabPanel('usa', DT::dataTableOutput('usaTable'))
      )
    )
  )
))
