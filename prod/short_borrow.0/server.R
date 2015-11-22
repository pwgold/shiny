library(shiny)
library(ggplot2)

getData = function(country){
	filename = paste('/home/ubuntu/aws/collect/InteractiveBrokers/data.', country, '/2015-11-20%201605.', country, '.txt', sep='')
	data = read.csv(filename, sep='|',header=TRUE,skip=1)
	return(data)
}

australia = getData('australia')
british = getData('british')
canada = getData('canada')

shinyServer(function(input, output) {

  ## choose columns to display
  ##diamonds2 = diamonds[sample(nrow(diamonds), 1000), ]
  #output$mytable1 <- DT::renderDataTable({
  ##  DT::datatable(diamonds2[, input$show_vars, drop = FALSE]) # restricts to 1000 / 53k entries
  #  DT::datatable(diamonds[, input$show_vars, drop = FALSE])   # show_vars allows the radio buttons to control the display
  ##  DT::datatable(diamonds)
  #})

  output$canadaTable <- DT::renderDataTable({
    DT::datatable(canada[, input$show_vars_canada, drop = FALSE])  
  })  

  output$britishTable <- DT::renderDataTable({
    DT::datatable(british[, input$show_vars_british, drop = FALSE])  
  })

  output$australiaTable <- DT::renderDataTable({
    DT::datatable(australia[, input$show_vars_australia, drop = FALSE])
  })

  ## sorted columns are colored now because CSS are attached to them
  #output$mytable2 <- DT::renderDataTable({
  #  DT::datatable(mtcars, options = list(orderClasses = TRUE))
  #})

  ## customize the length drop-down menu; display 5 rows per page by default
  #output$mytable3 <- DT::renderDataTable({
  #  DT::datatable(iris, options = list(lengthMenu = c(5, 30, 50), pageLength = 5))
  #})

  # test
  #output$britishTable <- DT::renderDataTable({
  ##  DT::datatable(diamonds[, input$show_vars, drop = FALSE])   # doesn't work well to have diamonds again here
  #  DT::datatable(british[, input$show_vars_british, drop = FALSE])   # doesn't work well to have diamonds again here
  #})

})
