
library(shiny)
library(shinydashboard)
library(highcharter)

shinyUI(dashboardPage(
    dashboardHeader(title = "U.E. Cambridge School"),
    dashboardSidebar(
        conditionalPanel(
            "input.selec=='INFO ESTUDIANTES'",
           
            selectInput("CURSO",label = "Seleccione el Curso",
                        choices = c("Primero","Segundo","Tercero",
                                    "Cuarto","Quinto","Sexto","Septimo",
                                    "Octavo","Noveno","Decimo")
            ),
            selectInput("variable", "Seleccione la Variable a Graficar ", 
                        choices =c( "CUALITATIVO", "COMPORTAMIENTO") )
        ),
        conditionalPanel("input.selec=='PREDECIR RENDIMIENTO'",
                         radioButtons("id_sexo",
                                      "Sexo del Alumno:",
                                      choiceNames= c("Masculino","Femenino"),choiceValues = c("M","F"),inline = TRUE),
                         
                         numericInput("id_edad",
                                      "Edad del Alumno:",
                                      min = 15,
                                      max = 22,
                                      value = 16),
                         
                         numericInput("id_fallos",
                                      "Fallos a Clase:",
                                      min = 0,
                                      max = 3,
                                      value = 1),
                         
                         numericInput("id_relaFamiliar",
                                  "Relación Familiar de 1 (Muy mala) a 5 (Muy buena):",
                                      min = 1,
                                      max = 5,
                                      value = 1),
                         
                         
                         numericInput("id_tiempoLibre",
                                      "Tiempo Libre de 1 (Muy bajo) a 5 (Muy alto):",
                                      min = 1,
                                      max = 5,
                                      value = 1),
                         
                         radioButtons("id_zona",
                                      "Zona de Domicilio:",
                                      choiceNames= c("Urbana","Rural"),choiceValues = c("U","R"),inline = TRUE),
                         
                         
                         numericInput("id_alcholLabor",
                                      "Consumo de Alcohol en Días Laborables de 1 (Muy bajo) a 5 (Muy alto):",
                                      min = 1,
                                      max = 5,
                                      value = 1),
                         
                         
                         numericInput("id_salidaAmigos",
                                      "Salidas con Amigos de 1 (Muy bajo) a 5 (Muy alto):",
                                      min = 1,
                                      max = 5,
                                      value = 1),
                         
                         
                         radioButtons("id_razon",
                                      "Motivo Para Elegir este Colegio:",
                                      choiceNames= c("Cerca de Casa","Nivel de Estudios","Reputación","Otros"),choiceValues = c("cerca_de_casa","nivel_Estudio","reputacion","otro")),
                         
                         
                         
                         radioButtons("id_representante",
                                      "Representante del Alumno:",
                                      choiceNames= c("Madre","Padre","Otros"),choiceValues = c("madre","padre","otros")),
                         
                         
                         radioButtons("id_estadoPadres",
                                      "Estado de Convivencia de los Padres:",
                                      choices= c("Juntos","Separados"),inline = TRUE),
                         
                         
                         
                         numericInput("id_tiempoTrayecto",
                                      "Tiempo de Viaje de la Casa al Colegio 1 (15 min), 2 (15 a 30 min), 3 (30 min A 1 hora), 4 (1 hora):",
                                      min = 1,
                                      max = 4,
                                      value = 1),
                         
                         
                         radioButtons("id_internet",
                                      "Acceso a Internet en el hogar :",
                                      choiceNames = c("Si Tiene","No Tiene"),choiceValues = c("si","no"),inline = TRUE),
                         
                         
                         radioButtons("id_tamFamilia",
                                      "Tamaño Familiar del Alumno :",
                                      choiceNames = c("Menor o Igual a 3","Mayor a 3"),choiceValues = c("<=3",">3")),
                         
                         
                         numericInput("id_tiempoEstudio",
                                      "Tiempo de Estudio Semanal :",
                                      min = 1,
                                      max = 4,
                                      value = 1),
                         
                         
                         numericInput("id_alcholFinSemana",
                                      "Consumo de Alcohol Fines de Semana de 1 (Muy bajo) a 5 (Muy alto):",
                                      min = 1,
                                      max = 5,
                                      value = 1),
                         
                         
                         radioButtons("id_relacionSentimental",
                                      "Tiene una Relación Romantica :",
                                      choiceNames = c("Si Tiene","No Tiene"),choiceValues = c("si","no"),inline = TRUE),
                         
                         
                         numericInput("id_ausencias",
                                      "Número de Ausencias Escolares:",
                                      min = 0,
                                      max = 100,
                                      value = 1),
                         
                         
                         numericInput("id_primerQuimestre",
                                      "Nota del Primer Quimestre sobre 20:",
                                      min = 3,
                                      max = 19,
                                      value = 3)
                                                
                         
                         ),
        conditionalPanel("input.selec=='PREDECIR DESERCION'",
                         radioButtons("de_sexo",
                                      "Sexo del Alumno:",
                                      choiceNames= c("Masculino","Femenino"),choiceValues = c("M","F"),inline = TRUE),
                         
                         numericInput("de_edad",
                                      "Edad del Alumno:",
                                      min = 15,
                                      max = 22,
                                      value = 16),
                         
                         numericInput("de_fallos",
                                      "Fallos a Clase:",
                                      min = 0,
                                      max = 3,
                                      value = 1),
                         
                         radioButtons("de_relaFamiliar",
                                      "Relación Familiar de 1 (Muy mala) a 5 (Muy buena):",
                                      choices = c(1,2,3,4,5),inline = TRUE),
                         
                         
                         radioButtons("de_tiempoLibre",
                                      "Tiempo Libre de 1 (Muy bajo) a 5 (Muy alto):",
                                      choices = c(1,2,3,4,5),inline = TRUE),
                         
                         radioButtons("de_zona",
                                      "Zona de Domicilio:",
                                      choiceNames= c("Urbana","Rural"),choiceValues = c("U","R"),inline = TRUE),
                         
                         
                         radioButtons("de_alcholLabor",
                                      "Consumo de Alcohol en Días Laborables de 1 (Muy bajo) a 5 (Muy alto):",
                                      choices = c(1,2,3,4,5),inline = TRUE),
                         
                         
                         radioButtons("de_salidaAmigos",
                                      "Salidas con Amigos de 1 (Muy bajo) a 5 (Muy alto):",
                                      choices = c(1,2,3,4,5),inline = TRUE),
                         
                         
                         radioButtons("de_razon",
                                      "Motivo Para Elegir este Colegio:",
                                      choiceNames= c("Cerca de Casa","Nivel de Estudios","Reputación","Otros"),choiceValues = c("cerca_de_casa","nivel_Estudio","reputacion","otro")),
                         
                         
                         
                         radioButtons("de_representante",
                                      "Representante del Alumno:",
                                      choiceNames= c("Madre","Padre","Otros"),choiceValues = c("madre","padre","otros")),
                         
                         
                         radioButtons("de_estadoPadres",
                                      "Estado de Convivencia de los Padres:",
                                      choices= c("Juntos","Separados"),inline = TRUE),
                         
                         
                         
                         radioButtons("de_tiempoTrayecto",
                                      "Tiempo de Viaje de la Casa al Colegio 1 (15 min), 2 (15 a 30 min), 3 (30 min A 1 hora), 4 (1 hora):",
                                      choices = c(1,2,3,4),inline = TRUE),
                         
                         
                         radioButtons("de_internet",
                                      "Acceso a Internet en el hogar :",
                                      choiceNames = c("Si Tiene","No Tiene"),choiceValues = c("si","no"),inline = TRUE),
                         
                         
                         radioButtons("de_tamFamilia",
                                      "Tamaño Familiar del Alumno :",
                                      choiceNames = c("Menor o Igual a 3","Mayor a 3"),choiceValues = c("<=3",">3")),
                         
                         
                         radioButtons("de_tiempoEstudio",
                                      "Tiempo de Estudio Semanal :",
                                      choiceNames = c("2 Horas","2-5 Horas","5-10 Horas","10 Horas"),choiceValues = c(1,2,3,4)),
                         
                         
                         radioButtons("de_alcholFinSemana",
                                      "Consumo de Alcohol Fines de Semana de 1 (Muy bajo) a 5 (Muy alto):",
                                      choices = c(1,2,3,4,5),inline = TRUE),
                         
                         
                         radioButtons("de_relacionSentimental",
                                      "Tiene una Relación Romantica :",
                                      choiceNames = c("Si Tiene","No Tiene"),choiceValues = c("si","no"),inline = TRUE),
                         
                         
                         numericInput("de_ausencias",
                                      "Número de Ausencias Escolares:",
                                      min = 0,
                                      max = 200,
                                      value = 1),
                         
                         
                         numericInput("de_primerQuimestre",
                                      "Nota del Primer Quimestre sobre 20:",
                                      min = 1,
                                      max = 20,
                                      value = 1)
                         
                         
        )
        
    ),
    dashboardBody(tags$img(src="https://upload.wikimedia.org/wikipedia/commons/b/b4/Logo_colegio_cambridge_school.png",height = "50px", width = "50px",align="right"),
        tabsetPanel(
            tabPanel("INFO ESTUDIANTES",
                     h3("Información De Rendimiento y Comportamiento de los Estudiantes de la U.E. Cambridge School"),
                     br(),
                     dataTableOutput("tabla"),
                     highchartOutput("grafico"),
                     tableOutput("ren")
            ),
            tabPanel("PREDECIR RENDIMIENTO",
                     h3("Predicción de Rendimiento Cambridge School"),
                     HTML("<p>Ingrese los <strong>DATOS DEL ALUMNO</strong> y presione <strong>EJECUTAR</strong></p>"),
                     actionButton("id_buttonRen","<<<<<< EJECUTAR >>>>>>",width = "200px"),
                     textOutput("ejecucionRen"),
                     br(),
                     br(),
                     tags$img(src="https://scontent.fuio7-1.fna.fbcdn.net/v/t1.0-9/22789126_10151024001249949_3345421567798675749_n.jpg?oh=500e6a1cf8161f7b9832be4f4d45ca09&oe=5AF8FE95",height = "800px", width = "900px"),
                     br(),
                     tags$img(src="https://scontent.fuio7-1.fna.fbcdn.net/v/t1.0-9/13873135_10150710959744949_7327716753373049653_n.jpg?oh=9cf13e170741c19b2e98770121abc506&oe=5AFA03CE",height = "600px", width = "900px"),
                     br(),
                     tags$img(src="https://scontent.fuio7-1.fna.fbcdn.net/v/t1.0-9/13654279_10150714263554949_8151746201187198870_n.jpg?oh=f0f5641808b1af648706178067a6d97f&oe=5ABEB237",height = "500px", width = "900px")
            ),
            tabPanel("PREDECIR DESERCION",
                     h3("Deserción de Alumnos Cambridge School"),
                     HTML("<p>Ingrese los <strong>DATOS DEL ALUMNO</strong> al lado izquierdo de la aplicación</p>"),
                     actionButton("id_buttonRen","<<<<<< EJECUTAR >>>>>>",width = "200px"),
                     br(),
                     br(),
                     tags$img(src="http://noticias.universia.net.co/net/images/educacion/d/de/des/desercion-estudiantil-universidades-responsables-universia.jpg",height = "350px", width = "700px")
            ),id = "selec"
        )
    )
)
    
    
    
    
    
    
)
