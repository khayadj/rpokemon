
pokemon <- read.csv2("pokemon.csv", h = T)
type <- read.csv2("estType.csv", h = T)
evolution <- read.csv2("evolueEn.csv", h = T)
dresseur <- read.csv2("dresseur.csv", h = T)
detientPokemon <- read.csv2("detientPokemon.csv", h = T)
stockPokemon <- read.csv2("stockePokemon.csv", h = T)

library("shiny")

shinyUI(fluidPage(
  titlePanel("Les Pokémonnnnnnnnnnnnnnnnnns"),
  selectInput("choix", "abscisse",c("PV","Force","Defense","Vitesse","Special")),
  plotOutput("test")
))
