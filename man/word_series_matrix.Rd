% Generated by roxygen2 (4.1.1.9000): do not edit by hand
% Please edit documentation in R/matrices.R
\name{word_series_matrix}
\alias{word_series_matrix}
\title{Aggregate (word/topic) counts by time period}
\usage{
word_series_matrix(tdm, dates, breaks = "years")
}
\arguments{
\item{tdm}{a matrix (or Matrix) with some feature (e.g. topics or words) in
rows and datable  in columns}

\item{dates}{a Date vector, one for each column of \code{tdm}}

\item{breaks}{passed on to \code{link[base]}{cut.Date} (q.v.): what interval
  should the time series use?}
}
\value{
A matrix where each row is a time series and each column sums to 1.
  If you wish to generate a time series without normalization or with rolling
  means or other smoothing, use the \code{\link{sum_col_groups}} function in
  conjunction with \code{\link[base]{cut.Date}}.
}
\description{
This convenience function transforms a topic-document or term-document matrix
into a topic (term) time-period matrix. This is meant for the common
application in which document date metadata will be used to generate time
series. Values are normalized so that they total to 1 in each time period.
Any matrix can be transformed in this way, however, as long as its columns
can be matched against date data.
}
\details{
N.B. that though topics are the most obvious row variable and documents are
the most obvious column variable, it may also make sense to preaggregate
multiple words or topics into some larger construct. Similarly, if the
documents can be grouped into aggregates with their own periodicity (e.g.
periodical issues), there is no reason not to set \code{tdm} to a matrix with
columns already summed together. You can of course also do this summing
post-hoc, but then it's important to be careful about normalization.
Naturally nothing stops you from supplying a slice of the topic-document
matrix to study series of proportions within some subset of topics/documents,
rather than the whole. Again interpreting normalized proportions will require
some care.
}
\examples{
\dontrun{
# time series within topic 10 of "solid", "flesh", "melt"
# after loading sampling state on model m
sm10 <- tdm_topic(m, 10) \%>\%
   word_series_matrix(metadata(m)$pubdate) \%>\%
gather_matrix(sm10[word_ids(c("solid", "flesh", "melt")), ],
              col_names=c("word", "year", "weight"))
}
}
\seealso{
\code{\link{topic_series}} for the common case in which you
  ultimately want a "long" data frame with topic proportions,
  \code{\link{sum_col_groups}} and \code{\link{normalize_cols}}, which this
  wraps together, \code{\link{gather_matrix}} for converting the result to a
  data frame, and \code{\link{doc_topics}} (but you need its
  \emph{transpose}), \code{\link{tdm_topic}}, and
  \code{\link{instances_Matrix}} for possible matrices to supply here
}

