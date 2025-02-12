% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/odkx_retrieve_data.R
\name{odkx_retrieve_data}
\alias{odkx_retrieve_data}
\title{Visit control sheet list generation}
\usage{
odkx_retrieve_data(
  suitcase_dir,
  jar_file,
  server_url,
  table_id,
  user,
  pass,
  is_linux = FALSE,
  download_dir = NULL,
  attachments = TRUE
)
}
\arguments{
\item{suitcase_dir}{The directory of the suitcase jar file}

\item{jar_file}{The name of the suitcase jar file (without the full path)}

\item{server_url}{The url of the ODK-X server, including the https prefix}

\item{table_id}{The name of the table to be downloaded}

\item{user}{Username}

\item{pass}{Password}

\item{is_linux}{Whether or not on a linux system}

\item{download_dir}{Path to download the data; if NULL, will download to the directory of the jar file by default}

\item{attachments}{Boolean; whether or not to download attachments too (default is TRUE)}
}
\value{
A table will be created
}
\description{
Render a visit control sheet
}
