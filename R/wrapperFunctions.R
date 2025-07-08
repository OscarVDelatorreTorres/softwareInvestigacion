getCombinations <- function(elementos) {
  n <- length(elementos)
  if (n < 2) {
    stop("El vector de entrada debe tener al menos 2 elementos para generar combinaciones de al menos tamaño 2.")
  }
  
  todas_combinaciones <- list()
  
  for (k in 2:n) {
    combinaciones_k <- combn(elementos, k)
    # Convertir cada columna (combinación) a un vector de texto
    combinaciones_texto <- apply(combinaciones_k, 2, function(col) paste(col, collapse = ","))
    todas_combinaciones <- c(todas_combinaciones, combinaciones_texto)
    
  }
  
  # Convertir la lista de vectores en un solo vector de texto
  combinaciones <- unlist(todas_combinaciones)
  return(combinaciones)
}

getCombinationsNumber <- function(elementos) {
  n <- length(elementos)
  if (n < 2) {
    stop("El vector de entrada debe tener al menos 2 elementos para generar combinaciones de al menos tamaño 2.")
  }
  
  todas_combinaciones <- list()
  
  for (k in 2:n) {
    combinaciones_k <- combn(elementos, k)
    # Convertir cada columna (combinación) a un vector de texto
    combinaciones_texto <- apply(combinaciones_k, 2, function(col) {paste0("c(",paste(col, collapse = ","),")")})
    todas_combinaciones <- c(todas_combinaciones, combinaciones_texto)
  }
  
  # Convertir la lista de vectores en un solo vector de texto
  vector_resultado <- unlist(todas_combinaciones)
  return(vector_resultado)
}
#===== portfolio analysis functions:


minVariancePortfolio=function(inputData,shortsRestriction=TRUE){
  
  if (is.Date(inputData[[1]])){
    returns_df=inputData[,2:ncol(inputData)]  
  } else {
    returns_df=inputData[,2:ncol(inputData)]
  }
  
  Sigma <- cov(returns_df)
  n_assets <- ncol(Sigma)
  
  Dmat <- 2 * Sigma
  dvec <- rep(0, n_assets)
  
  n_assets=ncol(returns_df)
  # Establishing the constraints:
  
  if (isTRUE(shortsRestriction)){
    
    Amat=matrix(rep(1, n_assets), ncol = 1)
    bvec <- c(1)
    meq <- 1
    
  } else {
    
    Amat <- cbind(rep(1, n_assets), diag(n_assets))
    bvec <- c(1, rep(0, n_assets))
    meq <- 1
    
  }
  
  # Solving the cuadratic program:
  continueTest=TRUE
  sol=tryCatch({
    quadprog::solve.QP(Dmat, dvec, Amat, bvec, meq = meq)
  }, error=function(e){
    continueTest<<-FALSE
    return(NA) 
    })  
  
  if (isTRUE(continueTest)){
    weights[abs(weights) < 1e-6]=0
    weights[which(weights<0)]=0
    # They come normalized (ad to 1), but a second normalization will help:
    weights=(sol$solution)/sum(sol$solution)  
    
    # Percentage variation of the most rescent date in the inputData time series
    varPortT=  sum(weights*tail(returns_df[,2:ncol(returns_df)],1))
    
    portAnalysisOut=list(
      weights=weights,
      varPortT=varPortT,
      continueTest=continueTest
    )
    
  } else {
    portAnalysisOut=list(
      weights=NA,
      varPortT=NA,
      continueTest=continueTest
    )
  }
  
  # We extract the weights and normalize them in case it were necessary.   

  return(portAnalysisOut)
}
