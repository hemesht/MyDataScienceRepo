pollutantmean <- function(directory, pollutant, id = 1:332) {
  file_list<- list.files(paste(getwd(),directory, sep ="/"), full.names = TRUE) 
  poldata <- data.frame()
  
  for (i in id) {
    poldata <- rbind(poldata , read.csv(file_list[i]))
  }
  
  mean(poldata[, pollutant], na.rm = TRUE)
}
