
#' Start cluster with ODBC
#' @param env_file env file folder
#' @export

connect_cluster <- function(env_file = ".env",
                            load_odbclibs = TRUE,
                            odbc_module_path = Sys.getenv("MODULE_FOLDER")) {
  dotenv::load_dot_env(env_file)
  if (load_odbclibs){
    dyn.load(paste0(odbc_module_path, "/odbc-module/driver/unixODBC-2.3.11/odbcinst/.libs/libodbcinst.so"),
             now=TRUE)
    dyn.load(paste0(odbc_module_path, "/odbc-module/driver/unixODBC-2.3.11/DriverManager/.libs/libodbc.so.2"),
             now=TRUE)
  }
  con <- DBI::dbConnect(odbc::odbc(), "Databricks")
  con
}

#' Stop cluster with ODBC
#' @param con connection
#' @export

disconnect_cluster <- function(con) {
  DBI::dbDisconnect(con)
}

