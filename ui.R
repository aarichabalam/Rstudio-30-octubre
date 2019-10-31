# Rely on the 'WorldPhones' dataset in the datasets
# package (which generally comes preloaded).
pe <- t(USPersonalExpenditure) 
total <- pe[,1]+pe[,2]+pe[,3]+pe[,4]+pe[,5]
total <- t(t(total))
colnames(total) <- c("Total")
pe <- cbind(pe,total)

# Use a fluid Bootstrap layout
fluidPage(    
  
  # Give the page a title
  titlePanel("Data de gastos personales"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("tipo", "Tipo:", 
                  choices=colnames(pe)),
      hr(),
      helpText("Data from The World Almanac and Book of Facts, 1962, page 756..")
    ),
    
    # Create a spot for the barplot
    mainPanel(
      plotOutput("phonePlot")  
    )
    
  )
)