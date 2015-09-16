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
