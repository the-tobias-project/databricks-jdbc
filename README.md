# Connection module for databricks using ODBC

## Usage

This module requires a .env file (default search to your current working directory):

```
DATABRICKS_HOSTNAME=
DATABRICKS_TOKEN=
DATABRICKS_HTTP_PATH=
DATABRICKS_PORT=
```

These could be extracted from the databricks url as follows:

Go to compute > cluster in databricks, and select the cluster, then collect the fields shown in the JDBC information at the bottom.


Then use the following function in your R session:

```r
library(loaddatabricks)
con <- connect_cluster(env_file=".env") # choose a path if not env_file=".env", e.g. "/home/custom/.env"
```

And for example:

```r
dbListTables(con)
```
