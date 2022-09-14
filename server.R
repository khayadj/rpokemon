pokemon <- read.csv2("pokemon.csv", h = T)
type <- read.csv2("estType.csv", h = T)
evolution <- read.csv2("evolueEn.csv", h = T)
dresseur <- read.csv2("dresseur.csv", h = T)
detientPokemon <- read.csv2("detientPokemon.csv", h = T)
stockPokemon <- read.csv2("stockePokemon.csv", h = T)

library("shiny")

shinyServer(function(input, output) {
  output$test <- renderPlot({
    plot(pokemon[,input$choix] ~ pokemon$id_pok, main = "PV des pokemons")
  })
})