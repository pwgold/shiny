library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

    getData = function(country, date){
        	filename = paste('/home/ubuntu/aws/collect/InteractiveBrokers/data.CLEAN/data.', country, '/', date, '%201605.', country, '.txt', sep='')
	        data = read.csv(filename, sep='|',header=TRUE,skip=1)
         	return(data)
    }

    output$headerText  <- renderText({
      paste("Short Borrow Data from: ", as.character(input$date))
    })

  #output$canadaTable <- DT::renderDataTable({
  #  DT::datatable(canada[, input$show_vars_canada, drop = FALSE])  
  #})  
  # print_line = function(country){return(paste('output$',country, 'Table <- DT::renderDataTable({DT::datatable(',country,'[, input$show_vars_',country,', drop = FALSE])',sep=''))}

  output$australiaTable <- DT::renderDataTable({DT::datatable(getData('australia', as.character(input$date))[, input$show_vars_australia, drop = FALSE])})
  output$austriaTable <- DT::renderDataTable({DT::datatable(getData('austria', as.character(input$date))[, input$show_vars_austria, drop = FALSE])})
  output$belgiumTable <- DT::renderDataTable({DT::datatable(getData('belgium', as.character(input$date))[, input$show_vars_belgium, drop = FALSE])})
  output$britishTable <- DT::renderDataTable({DT::datatable(getData('british', as.character(input$date))[, input$show_vars_british, drop = FALSE])})
  output$canadaTable <- DT::renderDataTable({DT::datatable(getData('canada', as.character(input$date))[, input$show_vars_canada, drop = FALSE])})	
  output$dutchTable <- DT::renderDataTable({DT::datatable(getData('dutch', as.character(input$date))[, input$show_vars_dutch, drop = FALSE])})	
  output$franceTable <- DT::renderDataTable({DT::datatable(getData('france', as.character(input$date))[, input$show_vars_france, drop = FALSE])})	
  output$hongkongTable <- DT::renderDataTable({DT::datatable(getData('hongkong', as.character(input$date))[, input$show_vars_hongkong, drop = FALSE])})
  output$indiaTable <- DT::renderDataTable({DT::datatable(getData('india', as.character(input$date))[, input$show_vars_india, drop = FALSE])})
  output$italyTable <- DT::renderDataTable({DT::datatable(getData('italy', as.character(input$date))[, input$show_vars_italy, drop = FALSE])})
  output$usaTable <- DT::renderDataTable({DT::datatable(getData('usa', as.character(input$date))[, input$show_vars_usa, drop = FALSE])})

})
