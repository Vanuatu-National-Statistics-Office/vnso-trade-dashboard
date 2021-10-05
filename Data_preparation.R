library(xlsx)
library(RSQLite)

setwd("C:/DataViz/Trades/SQLite_Flexdashboard/")
mydb <- dbConnect(RSQLite::SQLite(), "my-db.sqlite")


Import2019 <- read.csv("2019_Import.csv")
View(Import2019)



Export2019 <- read.csv("2019_Export.csv")

Import2020 <- read.csv("2020_Import.csv")
Emport2020 <- read.csv("2020_Export.csv")

importHistory <- read.csv("history/exportHistory.csv")
exportHistory <- read.csv("history/importHistory.csv")

dbWriteTable(mydb, "importHistory", importHistory, overwrite = TRUE)
dbWriteTable(mydb, "exportHistory", exportHistory, overwrite = TRUE)

officeExport <- dbGetQuery(mydb, "SELECT Office, Procedure, ")

dbListTables(mydb)

exp_hist <- dbGetQuery(mydb, "SELECT * FROM exportHistory")

imp_hist <- dbGetQuery(mydb, "SELECT * FROM importHistory")

imp_hist <- imp_hist %>% select (-id)
imp_hist <- imp_hist %>% select (-Date)




write.csv(exp_hist, "exportHistory.csv", row.names = FALSE)
write.csv(imp_hist, "importHistory.csv", row.names = FALSE)


