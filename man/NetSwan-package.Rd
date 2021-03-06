\name{NetSwan-package}
\alias{NetSwan-package}
\alias{NetSwan}
\docType{package}
\title{
\packageTitle{NetSwan}
}
\description{
\packageDescription{NetSwan}
}
\details{
The main goal of the 'NetSwan' library is to provide a set of  functions to study vulnerability, resilience and robustness of graphs. It depends on 'igraph' package. 'Igraph' graphs have a class used in 'NetSwan'.
}
\author{
\packageAuthor{NetSwan}

Maintainer: \packageMaintainer{NetSwan}
}


\keyword{ package }
\keyword{ network }
\keyword{ resilience }
\keyword{ vulnerability }
\keyword{ robustness }


\examples{
library(igraph)
library(NetSwan)
elec <- matrix(nc=2, byrow=TRUE, c(11,1, 11,10, 1,2, 2,3, 2,9, 
3,4, 3,8, 4,5, 5,6, 5,7, 6,7, 7,8, 8,9, 9,10))
gra<-graph.edgelist(elec, directed=FALSE)

f<-swan_efficiency(gra)
vertex_attr(gra, "efficiency_loss", index = V(gra))<-f
vertex_attr(gra)

f2<-swan_closeness(gra)
bet<-betweenness(gra)
reg<-lm(bet~f2)
summary(reg)

f3<-swan_connectivity(gra)

f4<-swan_combinatory(gra,10)
plot(f4[,1],f4[,5], type='o', col='yellow',xlab="Fraction of nodes removed",
      ylab="Connectivity loss")
lines(f4[,1],f4[,3], type='o', col='red')
lines(f4[,1],f4[,4], type='o', col='orange')
lines(f4[,1],f4[,2], type='o', col='blue')
legend('bottomright',c("Random", "Betweenness", "Degree", "Cascading"), 
          lty=c(1,1,1,1), pch=c(1,1,1,1), 
          col=c("yellow","blue","red", "orange"))
}
