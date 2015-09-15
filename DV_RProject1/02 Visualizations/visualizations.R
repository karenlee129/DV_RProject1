require("jsonlite")
require("RCurl")
require(extrafont)
require(ggplot2)

## Visualization 1
ggplot() + 
  coord_cartesian() + 
  scale_x_continuous() +
  scale_y_continuous() +
  labs(title='Titanic') +
  labs(x="Age", y=paste("Fare")) +
  layer(data=df1, 
        mapping=aes(x=suppressWarnings(as.numeric(as.character(AGE))),y=suppressWarnings(as.numeric(as.character(FARE))), color=SEX), 
        stat="identity", 
        stat_params=list(), 
        geom="point",
        geom_params=list(), 
        position=position_jitter(width=0.3, height=0)
  )

## SQL Query: select * from titanic  
## This visualization shows each passenger's fare based on his/her age and sex (sex can be null).

## Visualization 2
ggplot() + 
coord_cartesian() + 
scale_x_continuous() +
scale_y_continuous() +
labs(title='Titanic') +
labs(x="Age", y=paste("Fare")) +
layer(data=df2, 
mapping=aes(x=suppressWarnings(as.numeric(as.character(AGE))), y=suppressWarnings(as.numeric(as.character(FARE))), color=SEX), 
stat="identity", 
stat_params=list(), 
geom="point",
geom_params=list(), 
position=position_jitter(width=0.3, height=0)
)

## SQL Query: select * from titanic where sex is not null  
## This visualization shows each passenger's fare based on his/her age and sex (sex can't be null).

## Visualization 3
ggplot() + 
  coord_cartesian() + 
  scale_x_discrete() +
  scale_y_continuous() +
  labs(title='Titanic') +
  labs(x="SURVIVED", y=paste("FARE")) +
  layer(data=df2, 
        mapping=aes(x=SEX, y=as.numeric(as.character(FARE)), color=as.character(SURVIVED)), 
        stat="identity", 
        stat_params=list(), 
        geom="point",
        geom_params=list(), 
        position=position_jitter(width=0.3, height=0)
  )

## SQL Query: select * from titanic where sex is not null  
## This visualization shows whether each passenger survived or not vs their fare, with the x-axis separated by sex.

## Visualization 4
ggplot() + 
  coord_cartesian() + 
  scale_x_discrete() +
  scale_y_continuous() +
  facet_grid(PCLASS~SURVIVED, labeller=label_both) +
  labs(title='Titanic') +
  labs(x="SURVIVED", y=paste("FARE")) +
  layer(data=df2, 
        mapping=aes(x=as.character(SEX), y=as.numeric(as.character(FARE)), color=SEX),
        stat="identity", 
        stat_params=list(), 
        geom="point",
        geom_params=list(), 
        position=position_jitter(width=0.3, height=0)
  )

## SQL Query: select * from titanic where sex is not null  
## This visualization categorizes passengers by class and survival status, resulting in 6 different graphs. Each graph plots fare to sex. 

## Visualization 5
ggplot() + 
  coord_cartesian() + 
  scale_x_discrete() +
  scale_y_continuous() +
  facet_grid(PCLASS~SURVIVED, labeller=label_both) +
  labs(title='Titanic where age <= 10') +
  labs(x="SURVIVED", y=paste("FARE")) +
  layer(data=df3, 
        mapping=aes(x=as.character(SEX), y=as.numeric(as.character(FARE)), color=SEX),
        stat="identity", 
        stat_params=list(), 
        geom="point",
        geom_params=list(), 
        position=position_jitter(width=0.3, height=0)
  )

## SQL Query: select * from titanic where age <= 10  
## This visualization also categorizes passengers, 10 years and younger, by class and survival status, resulting in 6 different graphs. Each graph plots fare to sex. 

## Our Own Creation!
ggplot() + 
  coord_cartesian() + 
  scale_x_discrete() +
  scale_y_continuous() +
  labs(title='Titanic where age > 50') +
  labs(x="SURVIVED", y=paste("AGE")) +
  layer(data=df4, 
        mapping=aes(x=SEX, y=as.numeric(as.character(AGE)), color=as.character(SURVIVED)), 
        stat="identity", 
        stat_params=list(), 
        geom="point",
        geom_params=list(), 
        position=position_jitter(width=0.3, height=0)
  )

## SQL Query: select * from titanic where age > 50  
## This visualization compares the age and survival status of passengers over the age of 50. The graph separates the passengers by sex.

