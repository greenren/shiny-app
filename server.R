library(shiny)
data(faitful)
shinyServer(
    function(input, output) {  
        output$newHist <- renderPlot ({
            hist(faithful$waiting, xlab='Waiting Time in minutes', col='lightgreen', main='Histogram of Old Faithful\'s Waiting Times')
            mu <- input$mu
            lines(c(mu, mu), c(0, 50), col='orange', lwd=5)
            mse <- mean((faithful$waiting - mu)^2)
            text(63, 50, paste("Guessed mean = ", mu))
            text(63, 45, paste("Mean Squared Error = ", round(mse, 3)))
        })
    }
)