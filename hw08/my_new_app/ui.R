library(shiny)
library(tidyverse)
library(shinyjs)
library(stringr)
library(DT)
ui <- fluidPage(
	titlePanel("My liqiuor webpage"),
	sidebarPanel("BC Liquor Store",
	img(src="liquor.jpg",width="100%"),
	sliderInput("priceIn", "Price of booze", min = 0, max = 300,
							value = c(20,40), pre = "CAD"),
	radioButtons("typeIn", "Product type",
							 choices = c("BEER", "REFRESHMENT", "SPIRITS", "WINE"),
							 selected = "WINE"),
	selectInput("countryInput", "Country",
							choices = c("CANADA", "FRANCE", "ITALY")),
	downloadLink('downloadData', 'Download the results table here'),
	colourInput("col", "Choose color for the bars", "pink")),
  mainPanel(plotOutput("Hist_AlcCont"),
  					br(),br(),
  					textOutput("selected_var"),
  				  DT::dataTableOutput("table_head"))
)