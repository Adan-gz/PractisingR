#### HOW CAN I CALCULATE THE EUCLIDEAN DISTANCE AMONG EVERY POINTS IN A DATAFRAME?

### My proposal:
dist_euclidean <- function(df,scale=TRUE){
  df <- df[,sapply(df,is.numeric) ] # select numeric variables
  if(scale==TRUE) df <- purrr::map_df(df,scale) # scaled data
    # euclidean distance
  list_euclidean <- purrr::map(1:nrow(df), function(i){ 
    purrr::map_dbl(1:nrow(df), function(j){
      if(i==j) 0
      else if( anyNA(df[i,])==TRUE ) NA
      else sqrt(sum( (df[i,]-df[j,])^2 ))
      })  }) 
  names(list_euclidean) <- as.character(1:nrow(data))
   # data_euclidean <- bind_rows(list_euclidean) # if a dataframe would be preferred as output
  return(list_euclidean)
}
data_dist <- dist_euclidean(rbind(mtcars,rep(NA,ncol(mtcars))))

#### AND APPLYING NOW THE KMEANS ALGORITHM?
kmeans_cluster <- function(dist){
  
}
