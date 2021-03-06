% Generated by roxygen2 (4.1.1.9000): do not edit by hand
% Please edit documentation in R/model.R
\name{load_mallet_model_directory}
\alias{load_mallet_model_directory}
\title{Load a model with conventional filenames from a directory}
\usage{
load_mallet_model_directory(f, load_topic_words = F,
  load_sampling_state = F, metadata_file = NULL)
}
\arguments{
\item{f}{directory name}

\item{load_topic_words}{logical: load the full topic-word matrix?}

\item{metadata_file}{document metadata file(s) (optional)}
}
\value{
\code{mallet_model} object
}
\description{
If you accept the defaults from \code{\link{write_mallet_model}}, you can read t
results back in simply by passing the directory name here.
}
\details{
The expected filenames are \code{doc_topics.csv}, \code{doc_ids.txt},
\code{vocabulary.txt}, \code{top_words.csv}, \code{topic_words.csv}, and
\code{params.txt}.
}
\seealso{
\code{\link{load_mallet_model}},
  \code{\link{load_from_mallet_state}}
}

