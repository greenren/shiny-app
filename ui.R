library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Waiting for Old Faithful"),
    sidebarPanel(
        img(src="https://farm5.staticflickr.com/4016/4247558649_13a7d992dc.jpg", width=500, height=333),
        p("In this app we're looking at the faithful dataset in R. 
          Which records the waiting time between eruptions and the duration of the eruption 
          for the Old Faithful geyser in Yellowstone National Park, Wyoming, USA"),
        p("We'll try to figure out how long we can expect to wait on the next eruption, given how long the previous eruption took."),
        p("But first, you can guess the average waiting time on the right, by minimizing the Mean Sqaured Error.")
    ),
    
    mainPanel(
        h3('Guess the average waiting time for Old Faithful'),
        sliderInput('mu', 'Guess the average waiting time', value=45, min=43, max=96, step=0.1),
        plotOutput('newHist')
    )
))
