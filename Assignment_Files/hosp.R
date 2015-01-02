best=function(state, outcome) {
        csv=read.csv("outcome-of-care-measures.csv", colClasses="character")
        csv[,11]=as.numeric(csv[,11])
        csv[,17]=as.numeric(csv[,17])
        csv[,23]=as.numeric(csv[,23])
                 
        outcome=as.character(outcome)
        state=as.character(state)
        
        v=c("heart attack", "heart failure", "pneumonia")
        
        if (!outcome %in% v) stop("invalid outcome")

        if (!state %in% csv[,7]) stop("invalid state")

        new_csv=as.data.frame(csv[,c(2,7, 11,17,23)]) 
        colnames(new_csv)=c("hospital","State","heartattack", "heartfailure", "pneumonia") 
        
        min(new_csv$outcome, 
        
        outcome=sub(" ", "", outcome)
        outcome=as.factor(outcome)
        state=as.factor(state)
        ansdf=subset(new_csv, select=c(hospital, State, outcome), subset=(State==state), na.rm=T)
        ansdf
        
        new_csv[order(new_csv$pneumonia, new_csv$hospital), ]
        
}


        