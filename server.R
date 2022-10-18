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


function(input, output) {
  
  # Creation un espace vide pour mettre en place un graphique
  output$pokePlot <- renderPlot({
    
    # Mise en place un barplot
    a <- filter(jointure, jointure$type_pok == input$choix2)
    barplot(a[,input$choix] ~ a$nom_pok, 
            main = "Graphique des pokemons en fonction d'un attribut",
            ylab =input$choix,
            xlab ="Nom Pokemon",
            col = "blue",
            las = 2)

  })
  # Creation un espace vide pour mettre en place un tableau 
  output$Text1 <- renderText("Top 5 des pokemon selon l'attribut choisi")
  output$Table1 <- renderTable({
    
    pokemon[order(pokemon[,input$choix], decreasing = T)[1:5],]
  })
  
  # Creation un espace vide pour mettre en place un tableau
  output$Text2 <- renderText("Bot 5 des pokemon selon l'attribut choisi")
  output$Table2 <- renderTable({
    
    pokemon[order(pokemon[,input$choix], decreasing = F)[1:5],]
  })
  
  # Creation un espace vide pour mettre en place un graphique
  output$NbType <- renderPlot({
    
    # Mise en place d'un barplot
    barplot(table(jointure$type_pok),
            main = "Nombre de pokemon par type",
            ylab = "Nombre de pokemons",
            xlab = "Type des pokemons",
            col = "blue",
            las = 2)
  })
  
  # Creation un espace vide pour mettre en place un graphique
  output$MoyAttribut <- renderPlot({
    
    # Mise en place un boxplot
    boxplot(jointure$PV,jointure$Force,jointure$Defense,jointure$Vitesse,jointure$Special, 
            names = c("PV","Force","Defense","Vitesse","Special"),
            col = "blue")

  })
}




