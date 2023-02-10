
#' Start cluster with ODBC
#' @param env_file env file folder
#' @export

connect_cluster <- function(env_file = ".env") {
  dotenv::load_dot_env(env_file)
  dyn.load(paste0(Sys.getenv("HOME"), "/odbc-module/driver/unixODBC-2.3.11/odbcinst/.libs/libodbcinst.so"),
           now=TRUE)
  dyn.load(paste0(Sys.getenv("HOME"), "/odbc-module/driver/unixODBC-2.3.11/DriverManager/.libs/libodbc.so.2"),
                  now=TRUE)
  con <- DBI::dbConnect(odbc::odbc(), "Databricks")
  con
}

#' Stop cluster with ODBC
#' @param con connection
#' @export

disconnect_cluster <- function(con) {
  DBI::dbDisconnect(con)
}

