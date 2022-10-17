pokemon <- read.csv2("pokemon.csv", h = T)
type <- read.csv2("estType.csv", h = T)
evolution <- read.csv2("evolueEn.csv", h = T)
dresseur <- read.csv2("dresseur.csv", h = T)
detientPokemon <- read.csv2("detientPokemon.csv", h = T)
stockPokemon <- read.csv2("stockePokemon.csv", h = T)
jointure <- merge(x = pokemon, y = type, by = "id_pok", all.x = T)
install.packages("dplyr")
library("dplyr")


# Use a fluid Bootstrap layout
fluidPage(    
  
  # Give the page a title
  titlePanel("Pokemon"),
  
  # Generate a row with a sidebar
  sidebarLayout(      
    
    # Define the sidebar with one input
    sidebarPanel(
      selectInput("choix", "Attribut:", 
                  choices=c("PV","Force","Defense","Vitesse","Special")),
      selectInput("choix2", "Type:", 
                  choices=c("Combat","Dragon","Eau","Electrique","Feu","Glace","Insecte","Normal","Plante","Poison","Psy","Roche","Sol","Spectre","Vol")),
    ),
    
    # Create a spot for the barplot
    mainPanel(
      tabsetPanel(
        tabPanel("Graph Interactif",plotOutput("pokePlot")),
        tabPanel("Tables",textOutput("Text1"), tableOutput("Table1"),textOutput("Text2"),tableOutput("Table2")),
        tabPanel("Graph non interactifs", plotOutput("NbType"),plotOutput("MoyAttribut"))
      )
    )
  )
)