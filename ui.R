library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Some Title"),
    sidebarPanel(
        img(src="https://farm5.staticflickr.com/4016/4247558649_13a7d992dc.jpg"),
        h3('some more text')
    ),
    mainPanel(
        h3('yet some more text')
        
    )
))
