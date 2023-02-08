#' Create a connection to databricks
#' @param adress URL to the cluster
#' @param port port
#' @param organization organization id
#' @param cluster cluster ID
#' @param token access token
#' @export

databricks_jdbc <- function(address, port, organization, cluster, token) {
    location <- Sys.getenv("DATABRICKS_JAR")
    driver <- RJDBC::JDBC(driverClass = "com.databricks.client.jdbc.Driver",
                          classPath = location)
    con <- DBI::dbConnect(driver,
                          sprintf("jdbc:databricks://%s:%s/default;transportMode=http;ssl=1;httpPath=sql/protocolv1/o/%s/%s;AuthMech=3;UID=token;PWD=%s",
                                  address, port, organization, cluster, token))
    con
}

#' Start cluster with ODBC
#' @export

connect_cluster <- function() {
  con <- DBI::dbConnect(odbc::odbc(), "Databricks")
  con
}

#' Stop cluster with ODBC
#' @param con connection
#' @export

disconnect_cluster <- function(con) {
  DBI::dbDisconnect(con)
}

