rankall <- function(outcome, num = "best") {
        outcomecsv<- read.csv("outcome-of-care-measures.csv", colClasses="character")
        colnames(outcomecsv)[11] <- "heart attack"
        colnames(outcomecsv)[17] <- "heart failure"
        colnames(outcomecsv)[23] <- "pneumonia"
        colnames(outcomecsv)[2] <- "hospital"
        
        state <- as.character(state)
        outcome<-as.character(outcome)
        
        
        v=c("heart attack", "heart failure", "pneumonia")
        
        if (!outcome %in% v) stop("invalid outcome")
        
        #e<-subset(outcomecsv, State==state)
        f=outcomecsv[, c("hospital", outcome, "State")]
        f[,2]=as.numeric(f[,2])
        f=f[complete.cases(f), ]
        
        g=f[order(f[3], f[2], f[1]), ]
        
        #na.omit(f)

        states =g[, 3]
        states = unique(states)
        dfrm = data.frame("hospital"=character(), "state"=character())
        for (state in states){
        l=subset(g, select=c(hospital, State), subset=(State==state))
        if (num=="best")  L=l[1, c(1,2)]
        
        if (num=="worst")  L=l[nrow(l), c(1,2)]
        
        else  L=l[num, c(1,2)]
        
        dfrm=rbind(L, dfrm)}
        
        colnames(dfrm)=c("hospital", "state")
        dfrm
}
        
        
                


