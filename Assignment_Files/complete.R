complete <- function(directory, id = 1:332) {
        g=getwd()
        id=as.character(id)
        final=data.frame()
        for (monitor in id){
                monitor=paste("00",monitor, sep="")                
                idfinal=substr(monitor, nchar(monitor)-2, nchar(monitor))
                
                file=paste(g, "/", directory, "/", idfinal,".","csv", sep="")
                csv=read.csv(file)
                
                final=rbind(csv, final)}
        CCvec=complete.cases(final)
        CC=final[CCvec, ]
        #res=tapply(CC$sulfate, CC$ID, length)
        res=table(CC$ID)
        resres=as.data.frame(res)
        colnames(resres)=c("id", "nobs")
        resres
} 

