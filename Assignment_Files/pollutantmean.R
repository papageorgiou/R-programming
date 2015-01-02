pollutantmean <- function(directory, polutant, id = 1:332) {
        g=getwd()
        id=as.character(id)
        final=data.frame()
        for (monitor in id){
                monitor=paste("00",monitor, sep="")                
                idfinal=substr(monitor, nchar(monitor)-2, nchar(monitor))
                
                file=paste(g, "/", directory, "/", idfinal,".","csv", sep="")
                csv=read.csv(file)
                
                final=rbind(csv, final)
                
        }
        #final(head)
        #polutant=as.character(polutant)
        sub=subset(final, select=polutant)
        sub2=as.matrix(sub)
        mean(sub2, na.rm=TRUE)        
}