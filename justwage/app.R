library(shiny)

ui <- fluidPage(
  titlePanel("Just Wage Framework Online Tool"),
  sidebarLayout(
    sidebarPanel(width=4,
      checkboxGroupInput("checkGroup1", label = "Select applicable indicators:", 
                         choices = list("A wage covering the basics" = 1.1, 
                                        "Hours of work that are predictable" = 1.2, 
                                        "Resources that foster self-development" = 1.3, 
                                        "A healthy and safe working environment" = 1.4)),
      checkboxGroupInput("checkGroup2", label = NULL, 
                         choices = list("A wage providing disposable income" = 2.1, 
                                        "Opportunities for wage growth" = 2.2, 
                                        "Benefits for education and skills enhancement" = 2.3, 
                                        "Personal and community development" = 2.4)), 
      checkboxGroupInput("checkGroup3", label = NULL, 
                         choices = list("3.1" = 3.1, 
                                        "3.2" = 3.2, 
                                        "3.3" = 3.3, 
                                        "3.4" = 3.4)), 
      checkboxGroupInput("checkGroup4", label = NULL, 
                         choices = list("4.1" = 4.1, 
                                        "4.2" = 4.2, 
                                        "4.3" = 4.3, 
                                        "4.4" = 4.4)), 
      checkboxGroupInput("checkGroup5", label = NULL, 
                         choices = list("5.1" = 5.1, 
                                        "5.2" = 5.2, 
                                        "5.3" = 5.3, 
                                        "5.4" = 5.4)), 
      checkboxGroupInput("checkGroup6", label = NULL, 
                         choices = list("6.1" = 6.1, 
                                        "6.2" = 6.2, 
                                        "6.3" = 6.3, 
                                        "6.4" = 6.4)), 
      checkboxGroupInput("checkGroup7", label = NULL, 
                         choices = list("7.1" = 7.1, 
                                        "7.2" = 7.2, 
                                        "7.3" = 7.3, 
                                        "7.4" = 7.4))
    ),
    mainPanel(
      fluidRow(column(width=4, verbatimTextOutput("value2", placeholder = T)),
               column(width=4, verbatimTextOutput("value3", placeholder = T), offset=0),
               column(width=4, verbatimTextOutput("value4", placeholder = T), offset=0)
               ),
      fluidRow(column(width=4, verbatimTextOutput("value1", placeholder = T), offset=4)
               ),
      fluidRow(column(width=4, verbatimTextOutput("value5", placeholder = T)),
               column(width=4, verbatimTextOutput("value6", placeholder = T), offset=0),
               column(width=4, verbatimTextOutput("value7", placeholder = T), offset=0)
      )     
    #  fluidRow(column(5, verbatimTextOutput("value2")))
    )
  )
)

server <- function(input, output) {
  crit1 <- c(1.1, 1.2, 1.3, 1.4)
  crit2 <- c(2.1, 2.2, 2.3, 2.4)  
  crit3 <- c(3.1, 3.2, 3.3, 3.4)
  crit4 <- c(4.1, 4.2, 4.3, 4.4)
  crit5 <- c(5.1, 5.2, 5.3, 5.4)  
  crit6 <- c(6.1, 6.2, 6.3, 6.4)
  crit7 <- c(7.1, 7.2, 7.3, 7.4)
  
  usersel1 <- reactive({input$checkGroup1})
  usersel2 <- reactive({input$checkGroup2})
  usersel3 <- reactive({input$checkGroup3})
  usersel4 <- reactive({input$checkGroup4})
  usersel5 <- reactive({input$checkGroup5})
  usersel6 <- reactive({input$checkGroup6})
  usersel7 <- reactive({input$checkGroup7})
  
  output$value1 <- renderText({ 
    ifelse(length(usersel1())>0,  "1. Decent life", "")  
  })
  output$value2 <- renderText({ 
    ifelse(length(usersel2())>0,  "2. Asset building", "")  
  })
  output$value3 <- renderText({ 
    ifelse(length(usersel3())>0,  "3. Social Security", "")  
  })
  output$value4 <- renderText({ 
    ifelse(length(usersel4())>0,  "4. Non-discrimination", "")  
  })
  output$value5 <- renderText({ 
    ifelse(length(usersel5())>0,  "5. Non-excessive", "")  
  })
  output$value6 <- renderText({ 
    ifelse(length(usersel6())>0,  "6. Participation", "")  
  })  
  output$value7 <- renderText({ 
    ifelse(length(usersel7())>0,  "7. Performance and type", "")  
  })
}

shinyApp(ui, server)

