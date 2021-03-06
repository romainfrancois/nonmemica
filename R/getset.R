#' Check If Model is Fixed
#' 
#' Checks if model is fixed.  Returns a logical vector with element for each init, in canonical order.
#' @inheritParams fixed
#' @return logical
# @describeIn getset model method
#' @export
#' @family fixed
#' @examples
#' library(magrittr)
#' options(project = system.file('project/model',package='nonmemica'))
#' 1001 %>% as.model %>% fixed
fixed.model <- function(x,...){
  i <- initDex(x)
  j <- initSubscripts(x)
  nms <- nms_canonical(x)
  stopifnot(length(i) == length(j),length(i) == length(nms))
  f <- logical(0)
  for(e in seq_along(nms))f <- append(f,fixed(x[[i[[e]]]][[j[[e]]]]))
  f
}

#' Set fixed attribute of model
#' 
#' Sets fixed attribute of model.
#' @param x model
#' @param value logical
#' @return model
# @describeIn getset model method for setting fixed
#' @export
#' @family fixed
#' @keywords internal

`fixed<-.model` <- function(x,value){
  stopifnot(is.logical(value))
  i <- initDex(x)
  j <- initSubscripts(x)
  nms <- nms_canonical(x)
  stopifnot(length(i) == length(j),length(i) == length(nms))
  stopifnot(length(value) %in% c(1,length(nms)))
  value <- rep(value,length.out=length(nms))
  for(e in seq_along(value))fixed(x[[i[[e]]]][[j[[e]]]]) <- value[[e]]
  x
}

.getInitDetail <- function(x,...)UseMethod('.getInitDetail')
.getInitDetail.model <- function(x, y, ...){
  i <- initDex(x)
  j <- initSubscripts(x)
  nms <- nms_canonical(x)
  stopifnot(length(i) == length(j),length(i) == length(nms))
  d <- numeric(0)
  for(e in seq_along(nms))d <- append(d,x[[i[[e]]]][[j[[e]]]][[y]])
  d
}

.setInitDetail <- function(x,...)UseMethod('.setInitDetail')
.setInitDetail.model <- function(x, value, y, ...){
  i <- initDex(x)
  j <- initSubscripts(x)
  nms <- nms_canonical(x)
  stopifnot(length(i) == length(j),length(i) == length(nms), length(i) == length(value))
  for(e in seq_along(value)) x[[i[[e]]]][[j[[e]]]][[y]] <- value[[e]]
  x
}

### GET/SET LOWER ###################################33
#' Get Lower Value
#' 
#' Gets lower Value.
#' @param x object of dispatch
#' @param ... dots
#' @export
#' @family lower
#' @keywords internal
lower <- function(x,...)UseMethod('lower')

#' Get Lower Bounds for Model Initial Estimates
#' 
#' Gets lower bounds for model initial estimates.
#' @param x model
#' @param ... dots
# @describeIn getset model method for getting lower bounds
#' @export
#' @family lower
#' @examples
#' library(magrittr)
#' options(project = system.file('project/model',package='nonmemica'))
#' 1001 %>% as.model %>% lower
lower.model <- function(x,...).getInitDetail(x,y='low',...)

#' Set Lower Value
#' 
#' Sets lower Value.
#' @param x object of dispatch
#' @param value right hand side
#' @export
#' @family lower
#' @keywords internal
`lower<-` <- function(x, value)UseMethod('lower<-')

#' Set Lower Bounds for Model Initial Estimates
#' 
#' Sets lower bounds for model initial estimates.
#' @param x model
#' @param value numeric
# @describeIn getset model method for setting lower bounds
#' @export
#' @family lower
`lower<-.model` <- function(x, value).setInitDetail(x, value = value, y = 'low')

### GET/SET UPPER ###################################33
#' Get Upper Value
#' 
#' Gets upper Value.
#' @param x object of dispatch
#' @param ... dots
# @describeIn getset get upper generic
#' @export
#' @family upper
#' @keywords internal
upper <- function(x,...)UseMethod('upper')

#' Get Upper Bounds for Model Initial Estimates
#' 
#' Gets upper bounds for model initial estimates.
#' @param x model
#' @param ... dots
# @describeIn getset model method for getting upper bounds
#' @export
#' @family upper
#' @examples
#' library(magrittr)
#' options(project = system.file('project/model',package='nonmemica'))
#' 1001 %>% as.model %>% upper
upper.model <- function(x,...).getInitDetail(x,y='up',...)

#' Set Upper Value
#' 
#' Sets upper Value.
#' @param x object of dispatch
#' @param value right hand side
#' @export
#' @family upper
#' @keywords internal
`upper<-` <- function(x, value)UseMethod('upper<-')

#' Set Upper Bounds for Model Initial Estimates
#' 
#' Sets upper bounds for model initial estimates.
#' @param x model
#' @param value numeric
# @describeIn getset model method for setting upper bounds
#' @export
#' @family upper
`upper<-.model` <- function(x, value).setInitDetail(x,value = value, y = 'up')

### GET/SET INITIAL ESTIMATE ###################################33
#' Get Initial Value
#' 
#' Gets initial Value.
#' @param x object of dispatch
#' @param ... dots
#' @export
#' @family initial
#' @keywords internal
initial <- function(x,...)UseMethod('initial')

#' Get Model Initial Estimates
#' 
#' Gets model initial estimates.
#' @param x model
#' @param ... dots
# @describeIn getset model method for getting initial estimates
#' @export
#' @family initial
#' @examples
#' library(magrittr)
#' options(project = system.file('project/model',package='nonmemica'))
#' 1001 %>% as.model %>% initial
initial.model <- function(x,...).getInitDetail(x,y = 'init',...)

#' Set Initial Value
#' 
#' Sets initial Value.
#' @param x object of dispatch
#' @param value right hand side
#' @export
#' @family initial
#' @keywords internal
`initial<-` <- function(x, value)UseMethod('initial<-')

#' Set Upper Bounds for Model Initial Estimates
#' 
#' Sets upper bounds for model initial estimates.
#' @param x model
#' @param value numeric
# @describeIn initials model method for setting upper bounds
#' @export
#' @family initial
`initial<-.model` <- function(x, value).setInitDetail(x, value = value, y = 'init')
