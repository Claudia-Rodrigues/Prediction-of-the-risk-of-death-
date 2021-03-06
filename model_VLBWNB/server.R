
library(shiny)
library(shinythemes)
library(dplyr)
library(datasets)
library(round)#to round the result of the probability to three decimal places 


# Define server logic required 
shinyServer(function(input, output) {
    
    observeEvent(input$calculate,{
        a <-
        a <- input$GestationalAge
        b <- input$LengthBirth
        c1 <- ifelse(input$PrenatalCorticosteroids=="1",1,0)
        c2 <- ifelse(input$PrenatalCorticosteroids=="2",1,0)
        c3 <- ifelse(input$PrenatalCorticosteroids=="3",1,0)
        d1 <- ifelse(input$Sex=="1",1,0)
        d2 <- ifelse(input$Sex=="2",1,0)
        e <- input$AverageApgar
        f0 <- ifelse(input$InsufflatorResuscitation=="0",1,0)
        f1 <- ifelse(input$InsufflatorResuscitation=="1",1,0)
        g0 <- ifelse(input$MajorCongenitalMalformation=="0",1,0)
        g1 <- ifelse(input$MajorCongenitalMalformation=="1",1,0)
        h0 <- ifelse(input$DiagNec=="0",1,0)
        h1 <- ifelse(input$DiagNec=="1",1,0)
        i0 <- ifelse(input$PdaTerapeutic=="0",1,0)
        i1 <- ifelse(input$PdaTerapeutic=="1",1,0)
        
        pred <- 11.44585-0.01893*a-0.14922*b-2.05321 *c2-0.98091*c3-1.38401*d2-0.48216 *e-0.59988*f1+1.58796*g1+1.93493*h1-0.33204*i1
        pred <- exp(pred)/(1+exp(pred))
        
        prev <- ifelse(pred <0.626,"SURVIVE", "DIE")
        
        
        
        output$result<- renderText({HTML( paste("The prevision result is", round((pred*100),3),"%. It is likely that the newborn will",prev,"."))})
    })
    
    
    
    
    
    
})
