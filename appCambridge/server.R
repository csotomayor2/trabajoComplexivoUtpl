
library(shiny)
library(highcharter)
library(dplyr)
library(readxl)


url <- "https://github.com/csotomayor2/Taller3/blob/master/LISTA.xlsx?raw=true"
destfile <- "lista.xlsx"
curl::curl_download(url, destfile)
lista <- read_excel(destfile)

lista$PROMEDIO<-as.numeric(lista$PROMEDIO)
lista$CURSO<-as.factor(lista$CURSO)
lista$CUALITATIVO<-as.factor(lista$CUALITATIVO)
lista$COMPORTAMIENTO<- as.factor(lista$COMPORTAMIENTO)

#Cargamos el modelo
mod <- "https://github.com/csotomayor2/Taller3/blob/master/modeloRendi.RData?raw=true"
nomod <- "modeloRendi.RData"
curl::curl_download(mod, nomod)
modeloRen <- load(nomod)



shinyServer(function(input, output) {
 #================Empieza Info Estudiantes===============================  
    data <- reactive({
        
        data <- lista %>% filter(CURSO==input$CURSO)
        
        data})
    
    output$tabla <- renderDataTable(data())
    
    
    rendimiento <- reactive({
        data <- lista%>%filter(CURSO==input$CURSO)%>%
            group_by(get(input$variable)) %>%
            summarize(PROMEDIO=n())
        colnames(data)<-c("Variable", "Alumnos")
        data
    })
    
    output$grafico <- renderHighchart({
        hchart(rendimiento(), "pie", hcaes(x = Variable, y = Alumnos)) %>%
            hc_add_theme(hc_theme_538())
    })
    
    output$ren <- renderTable(rendimiento())
#================Termina Info Estudiantes=================================  
#==================Ejecutar Prediccion===================================
  
    ejecucion <- eventReactive(input$id_buttonRen,{
        baseRen<- data.frame(sexo=input$id_sexo,edad=input$id_edad,
                             FallosClase=input$id_fallos,relacionFamiliar=input$id_relaFamiliar,
                             tiempoLibre=input$id_tiempoLibre,zona=input$id_zona,
                             alcholDiasLab=input$id_alcholLabor,salidasAmigos=input$id_salidaAmigos,
                             razon=input$id_razon,Representante=input$id_representante,
                             EstadoPadres=input$id_estadoPadres,tiempoTrayecto=input$id_tiempoTrayecto,
                             Internet=input$id_internet,tamFamilia=input$id_tamFamilia,
                             tiempoEstudio=input$id_tiempoEstudio,alcholFinSemana=input$id_alcholFinSemana,
                             relacionSentimental=input$id_relacionSentimental,ausencias=input$id_ausencias,
                             X1Q=input$id_primerQuimestre,stringsAsFactors = TRUE) 
                                                                                                                
      
        prediccion <- predict(modeloRen,baseRen)
        as.character(prediccion)
        prediccion  
        
    })
    
    
    
   output$ejecucionRen <- renderText({
            paste0("El Rendimiento del Alumno será : ", ejecucion()) 
   })
#====================Termina Prediccion Rendimiento=================================================
   
   
})
