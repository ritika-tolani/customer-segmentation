####################################################
#      Customer Analysis using R    #
####################################################

library("shiny")

shinyUI(fluidPage(
  # Header:
  
  titlePanel(title=div(img(src="logo.jpg",height= "10%", width ="20%",align='Right'),"Grahak.IO")),
  # Input in sidepanel:
  sidebarPanel(

    fileInput("file", "Upload Segmentation data (csv file with header)"),
    fileInput("file1", "Upload Discriminant data (csv file with header)"),
    fileInput("file2", "Upload Classification data (csv file with header)"),
        
    selectInput("select", "Choose Segmentation Algo", 
                       c("K-Means","Hierarchical","Model Based"), selected = "K-Means"),
    
    numericInput("Clust", "Number of Segments:", 3),
    
    br(),

submitButton(text = "Upload Changes", icon("refresh"))
  ),
  # Main:
  mainPanel( 
    
    tabsetPanel(type = "tabs",
                tabPanel("About Us",align="center",
                         h3(p("Grahak.IO",style="font-family: Elephant;")), 
                         h4(p("We at Grahak.IO aim at easing your customer Relationship Management by Providing a graphical analysis of your customer database in a userfriendly way.Grahak.IO provides you with graphs/plots which can be easily downloaded and shared.",
                           align="justify",style="font-family: Palatino Linotype;")),                       
                         br(),
                         h3(p("How we do it ? ")), 
                         p("We use Clustering algorithms divide your customer data into groups that share similar characteristics and generate visual results in the form of plots/graph to help you get more value out of your data.Clustering algorithms such as K-means,hierarchial and model based help in segmenting data accurately based on which you can customize your interaction with customers",
                           align="justify"),                       
                         br(),
                         h3(p("How it helps your business ?")), 
                         p(" By analyzing your customer data effectively you can generate innovative ideas to startegize personalized marketing caimpaigns for each customer. These personalized experiences helps in fostering your relationship with them.",
                           align="justify"),
                         br()),
                    
                  tabPanel("Data Input Format",
                         h4(p("Data input")),
                         p("Grahak.IO requires you to input three data sets. To do so, click on the Browse (in left side-bar panel) and upload the Segmentation data input file. Similarly upload Discriminant and Classification data sets.
                           Note that this application can read only csv file(comma delimited file), so if you don't have csv input data file, first convert your data in csv format 
                           and then proceed. Make sure you have top row as variable names and first column as respondent id/name in csv file"
                           ,align="justify"),
                         img(src = "Segmentation.png", height = 180, width = 400),p('Segmentation Sample file'),
                         img(src = "Discriminant.png", height = 180, width = 400),p('Discriminant Sample file'),
                         img(src = "Classification.png", height = 180, width = 400),p('Classification Sample file'),
                         br(),
                         
                         p(" In left-side bar panel you can change the segmentation algorithm and number of segments. Click on Apply changes after making any change in the inputs. Accordingly results will be updates in all the tabs",
                           align="justify"),
                         br()),
                tabPanel("Example dataset", h4(p("Download Sample files")), br(),
                         downloadButton('downloadData1', 'Download Segmentation Sample file'), br(),br(),
                         downloadButton('downloadData2', 'Download Discriminant Sample file'), br(),br(),
                         downloadButton('downloadData3', 'Download Classification Sample file'), br(),br(),
                         
                         p("Please note that download will not work with RStudio interface. Download will work only in web-browsers. So open this app in a web-browser and then download the example file. For opening this app in web-browser click on \"Open in Browser\" as shown below -",
                         align="justify"),
                        img(src = "example1.png")),
                #tabPanel("Data",h3(textOutput("caption"),tableOutput("table"))),
                
                tabPanel("Summary - Segmentation",h3(textOutput("caption1")), h4(div(textOutput("caption2"),style = "color:Red")),
                         plotOutput("plotpca",height = 400, width = 500),verbatimTextOutput("summary")),
                
                tabPanel("Summary - Discriminant",plotOutput('discplot'),
                         verbatimTextOutput("discriminatp")),
                tabPanel("Summary - Targeting", verbatimTextOutput("targeting")),
                
                # discriminat
                
                tabPanel("Plot",h3("Segments Plot"), plotOutput("plot",height = 700, width = 840)),
                tabPanel("Data Segment",br(),
                         downloadButton('downloadData4', 'Download Segmentation file (Works only in browser)'), br(),br(),
                         dataTableOutput("table"),tags$head(tags$style("tfoot {display: table-header-group;}"))), 
                tabPanel("Data Target",br(),
                         downloadButton('downloadData5', 'Download Targeting file (Works only in browser)'), br(),br(),
                         dataTableOutput("table1")) 
                )
      ) 
    ) 
  )
# tabPanel("PCA Variance Plot",plotOutput("plot1", width = "100%")),
# tabPanel("JSM Plot",plotOutput("plot", height = 800, width = 840)),
