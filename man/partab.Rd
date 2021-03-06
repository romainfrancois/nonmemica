% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/partab.R
\name{partab}
\alias{partab}
\alias{partab.partab}
\title{Create Parameter Table}
\usage{
partab(x, ...)

\method{partab}{partab}(x, ...)
}
\arguments{
\item{x}{object of dispatch}

\item{...}{arguments to methods}
}
\description{
Creates a parameter table.

Creates a model parameter table from a partab object.
}
\details{
x can be numeric or character model name, assuming project is identified by argument or option.

Just returns the object unmodified.
}
\section{Methods (by class)}{
\itemize{
\item \code{partab}: partab method
}}

\seealso{
\code{\link{partab.character}}

Other partab: \code{\link{partab.character}},
  \code{\link{partab.numeric}}

Other partab: \code{\link{partab.character}},
  \code{\link{partab.numeric}}
}
