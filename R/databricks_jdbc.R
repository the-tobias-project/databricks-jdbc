#' Create a connection to databricks
#' @param adress URL to the cluster
#' @param port port
#' @param organization organization id
#' @param cluster cluster ID
#' @param token access token
#' @export

databricks_jdbc <- function(adress, port, organization, cluster, token) {
    location <- Sys.getenv("DATABRICKS_JAR")
    driver <- RJDBC::JDBC(driverClass = "com.databricks.client.jdbc.Driver",
                          classPath = location)
    conn <- DBI::dbConnect(driver,sprintf("jdbc:databricks://%s:%s/default;transportMode=http;ssl=1;httpPath=sql/protocolv1/o/%s/%s;AuthMech=3;UID=token;PWD=%s",
                                          adress, port, organization, cluster, token))
    con
}
