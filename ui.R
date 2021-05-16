####################################################
#      Customer Analysis using R    #
####################################################

library("shiny")

shinyUI(fluidPage(
  # Header:
  #headerPanel("Segmentation Discriminant & Classification"),
  titlePanel(title=div(img(src="logo.jpg",height= "10%", width ="20%",align='left'))),
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
                tabPanel("About Us",
                         h4(p("Grahak.IO")), 
                         p("Market segmentation is the process of dividing a target market into smaller, more defined categories. It segments customers and audiences into groups that share similar characteristics such as demographics, interests, needs, or location.",
                           align="justify"),
                         p("The importance of market segmentation is that it makes it easier to focus marketing efforts and resources on reaching the most valuable audiences and achieving business goals.",
                           align="justify"), 
                         br(),
                         h4(p("Discriminant analysis")), 
                         p("Discriminant analysis is statistical technique used to classify observations into non-overlapping groups, based on scores on one or more quantitative predictor variables.",
                           align="justify"),
                         p("Linear discriminant function analysis (i.e., discriminant analysis) performs a multivariate test of differences between groups.In addition, discriminant analysis is used to determine the minimum number of dimensions needed to describe these differences.  A distinction is sometimes made between descriptive discriminant analysis and predictive discriminant analysis.",
                           align="justify"),
                         br(),
                         h4(p("Statistical classification")), 
                         p("In machine learning and statistics, classification is the problem of identifying to which of a set of categories (sub-populations) a new observation belongs, on the basis of a training set of data containing observations (or instances) whose category membership is known. An example would be assigning a given email into \"spam\" or \"non-spam\" classes or assigning a diagnosis to a given patient as described by observed characteristics of the patient (gender, blood pressure, presence or absence of certain symptoms, etc.). Classification is an example of pattern recognition.",
                           align="justify"),
                         p("In the terminology of machine learning, classification is considered an instance of supervised learning, i.e. learning where a training set of correctly identified observations is available. The corresponding unsupervised procedure is known as clustering, and involves grouping data into categories based on some measure of inherent similarity or distance.",
                           align="justify")),
                    
                  tabPanel("Data Input Format",
                         h4(p("Data input")),
                         p("This shiny application requires three data inputs from the user. To do so, click on the Browse (in left side-bar panel) and upload the Segmentation data input file. Similarly upload Discriminant and Classification data sets.
                           Note that this application can read only csv file(comma delimited file), so if you don't have csv input data file, first convert your data in csv format 
                           and then proceed. Make sure you have top row as variable names and first column as respondent id/name in csv file"
                           ,align="justify"),
                         img(src = "Segmentation.png", height = 180, width = 400),p('Segmentation Sample file'),
                         img(src = "Discriminant.png", height = 180, width = 400),p('Discriminant Sample file'),
                         img(src = "Classification.png", height = 180, width = 400),p('Classification Sample file'),
                         br(),
                         
                         p("Once csv file is uploaded successfully, by-default application will perform K-means segmentation with 3 segments. In left-side bar panel you can change the segmentation algorithm and number of segments. Click on Apply changes after making any change in the inputs. Accordingly results will be updates in all the tabs",
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
