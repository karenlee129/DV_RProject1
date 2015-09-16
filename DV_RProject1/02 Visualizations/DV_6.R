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
