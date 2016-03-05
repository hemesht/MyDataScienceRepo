corr <- function(directory, threshold=0) {
  file_list<- list.files(paste(getwd(),directory, sep ="/"), full.names = TRUE) 
  corrdata <- vector(mode="numeric",length=0)
  
  for (i in 1:length(file_list)) {
    readcorrdat <- read.csv(file_list[i])
    corrsum <-sum((!is.na(readcorrdat$sulfate)) & (!is.na(readcorrdat$nitrate)))
    
    if(corrsum > threshold)
    {
      readcorrdat_temp <- readcorrdat[which(!is.na(readcorrdat$sulfate)), ]
      corrdata_temp <- readcorrdat_temp[which(!is.na(readcorrdat_temp$nitrate)), ]
      corrdata <- c(corrdata,cor(corrdata_temp$sulfate,corrdata_temp$nitrate))
    }
    
  }
  
  corrdata
  
  
}