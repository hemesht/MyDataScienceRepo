complete <- function(directory, id = 1:332) {
  file_list<- list.files(paste(getwd(),directory, sep ="/"), full.names = TRUE) 
  compdata <- data.frame()
  
  for (i in id) {
    readcompdat <- read.csv(file_list[i])
    numcomp <-sum(complete.cases(readcompdat))
    datfrm <- data.frame(i,numcomp)
    compdata <-rbind(compdata,datfrm)
    
  }

  colnames(compdata) <- c("id","nobs")
  compdata
   

}
