Prius<-read.csv("prius.csv")
Prius$Miles<-as.numeric(Prius$Miles/1000)
Prius$Year<-Prius$Year-2000
Prius$Year<-as.factor(Prius$Year)
#Prius<-subset(Prius,Miles<50 & Price < 17000 & Year %in% c(12,13,14,15,16))
Prius<-subset(Prius,Year %in% c(12,13,14,15,16))


pl<-ggplot(Prius, aes(y = Price, x = Miles)) 
pl<-pl + geom_point(aes(color = Trim, shape=Year), size=3) 
pl<-pl + geom_smooth(method=lm, se=FALSE, aes(color=Trim)) 
pl<-pl + ggtitle("Used Prius Pricing")
pl

png("Prius.png")
pl
dev.off()

pl2<-ggplot(Prius, aes(y = Price, x = Miles)) 
pl2<-pl + geom_point(aes(color = Website, shape=Trim), size=3) 
pl2<-pl + geom_smooth(method=lm, se=FALSE, aes(color=Website)) 
pl2<-pl + ggtitle("Used Prius Pricing")
pl2

png("Prius2.png")
pl2
dev.off()