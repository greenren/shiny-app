library(shiny)
data(faitful)
shinyServer(
    function(input, output) {  
        output$newHist <- renderPlot ({
            hist(faithful$waiting, xlab='Waiting Time in minutes', col='lightgreen', main='Histogram of Old Faithful\'s Waiting Times')
            mu <- input$mu
            lines(c(mu, mu), c(0, 50), col='orange', lwd=5)
            mse <- mean((faithful$waiting - mu)^2)
            text(46.5, 50, paste("Guessed mean = ", mu))
            text(50, 45, paste("Mean Squared Error = ", round(mse, 3)))
        })
        output$scatter <- renderPlot({
            with(faithful, plot(eruptions, waiting, col='lightgreen', pch=8, xlab='eruption time (minutes)', ylab='waiting time (minutes)', main='Waiting time by Eruption time'))
            with(faithful, abline(lm(waiting ~ eruptions), col='blue'))
            fit <- lm(waiting ~ eruptions, data=faithful)
            fitcoef <- fit$coef
            erupttime <- input$erupttime
            waittime <- fitcoef[1] + fitcoef[2] * erupttime
            points(erupttime, waittime, col='red', pch=8)
            text(1.95, 90, paste("Eruption time = ", round(erupttime, 2)))
            text(1.9, 85, paste("Estimated waiting\ntime = ", round(waittime, 2)))
        })
    }
)


#predict(fit, data.frame(eruptions=c(3)), interval='confidence')