
#' Start cluster with ODBC
#' @param env_file env file folder
#' @export

connect_cluster <- function(env_file = ".env") {
  dotenv::load_dot_env(env_file)
  con <- DBI::dbConnect(odbc::odbc(), "Databricks")
  con
}

#' Stop cluster with ODBC
#' @param con connection
#' @export

disconnect_cluster <- function(con) {
  DBI::dbDisconnect(con)
}

