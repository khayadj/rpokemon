#Importation des donnees et installation des packages necessaires

pokemon <- read.csv2("pokemon.csv", h = T)
type <- read.csv2("estType.csv", h = T)
evolution <- read.csv2("evolueEn.csv", h = T)
dresseur <- read.csv2("dresseur.csv", h = T)
detientPokemon <- read.csv2("detientPokemon.csv", h = T)
stockPokemon <- read.csv2("stockePokemon.csv", h = T)
jointure <- merge(x = pokemon, y = type, by = "id_pok", all.x = T)
install.packages("dplyr")
library("dplyr")


fluidPage(    
  
  # Titre du Shiny
  titlePanel("Pokemon"),
  
  # Generation de la barre lateral
  sidebarLayout(      
    
    # Definition des filtres present dans la barre lateral
    sidebarPanel(
      selectInput("choix", "Attribut:", 
                  choices=c("PV","Force","Defense","Vitesse","Special")),
      selectInput("choix2", "Type:", 
                  choices=c("Combat","Dragon","Eau","Electrique","Feu","Glace","Insecte","Normal","Plante","Poison","Psy","Roche","Sol","Spectre","Vol")),
    ),
    
    # Creation des differents pages et les graphiques qui les composent
    mainPanel(
      tabsetPanel(
        tabPanel("Graph Interactif",plotOutput("pokePlot")),
        tabPanel("Tables",textOutput("Text1"), tableOutput("Table1"),textOutput("Text2"),tableOutput("Table2")),
        tabPanel("Graph non interactifs", plotOutput("NbType"),plotOutput("MoyAttribut"))
      )
    )
  )
)