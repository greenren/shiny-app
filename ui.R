library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Waiting for Old Faithful"),
    sidebarPanel(
        h3('Introduction'),
        img(src="https://farm5.staticflickr.com/4016/4247558649_13a7d992dc.jpg", width=500, height=333),
        p("In this app we're looking at the 'faithful' dataset in R. 
          Which records the waiting time between eruptions and the duration of the eruption 
          for the Old Faithful geyser in Yellowstone National Park, Wyoming, USA"),
        p("We'll try to figure out how long we can expect to wait on the next eruption, given how long the previous eruption took."),
        p("But first you can guess the average waiting time on the right, by minimizing the Mean Sqaured Error."),
        
        h3('Waiting Time'),
        p("When we plot the waiting time against the eruption time, 
          you can see that there's a relation between how long an eruption
          took and how long it takes for the next eruption (the waiting time)."),
        p("In the plot on the right you can change how long the eruption time took 
          and it will then give an estimate about how long the waiting time on the next eruption will be."),
        p("As you can also see in the plot, however, the prediction isn't perfect. 
          There's a lot of variation around the prediction line. 
          Therefore, it is better to calculate a confidence interval to provide better estimatations."),
        p("Below you can enter the time the eruption took and it will calculate a waiting time interval (in minutes).  
          With a confidence of 95% the estimated waiting time will be in this interval."),
        numericInput('eruptconf', 'The eruption time in minutes:', 4, min=0, max=6, step=0.25)
        
    ),
    
    mainPanel(
        h3('Guess the average waiting time for Old Faithful'),
        sliderInput('mu', 'Guess the average waiting time', value=53, min=43, max=96, step=0.1),
        plotOutput('newHist'),
        
        h3('How long should you wait for the next eruption?'),
        sliderInput('erupttime', 'The previous eruption took how many minutes?', value=3.5, min=1.5, max=5.2, step=0.01),
        plotOutput('scatter'),
        
        h4('Waiting time confidence interval'),
        textOutput("confpred")
    )
))
