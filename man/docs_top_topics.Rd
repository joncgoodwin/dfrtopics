% Generated by roxygen2 (4.1.1.9000): do not edit by hand
% Please edit documentation in R/model_info.R
\name{docs_top_topics}
\alias{docs_top_topics}
\title{Top-ranked topics for documents}
\usage{
docs_top_topics(m, n, ...)
}
\arguments{
\item{m}{\code{mallet_model} object}

\item{n}{number of top topics to extract}

\item{weighting}{a function to transform the document-topic matrix. By
default, the topic proportions are used (same rank as raw weights)}
}
\value{
a data frame with three columns, \code{doc}, the numerical index of
  the document in \code{\link{doc_ids}(m)}, \code{topic}, and \code{weight},
  the weight used in ranking (topic proportion, by default)

a dataframe with \code{n} rows and two columns, \code{topic} and
  \code{weight}.
}
\description{
This function extracts the most salient topics for all documents from the
document-topic matrix.
}
\details{
Here as elsewhere "saliency" can be variously defined: though the easiest
choice is to choose the topic which captures the largest proportion of a
document, and that is the default, we might want to penalize topics which are
widespread across the whole corpus. TODO: actually implement the alternative
weighting.
}
\seealso{
\code{\link{doc_topics}}
}

