# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
pe <- t(USPersonalExpenditure) 
total <- pe[,1]+pe[,2]+pe[,3]+pe[,4]+pe[,5]
total <- t(t(total))
colnames(total) <- c("Total")
pe <- cbind(pe,total)

# Define a server for the Shiny app
function(input, output) {
  
  # Fill in the spot we created for a plot
  output$phonePlot <- renderPlot({
    
    # Render a barplot
    barplot(pe[,input$tipo]*1000, 
            main=input$tipo,
            ylab="Gastos personales",
            xlab="Anios", col = "lightblue")
  })
}