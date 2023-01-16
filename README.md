# connection module for databricks using JDBC

## Usage

This module requires five parameters: address, port, organization, cluster and token. These could be extracted from the databricks url as follows:

Go to compute > cluster in databricks, and select the cluster, then collect the following field:

https://adb-12345.azuredatabricks.net/?o=6789#setting/clusters/abcd/configuration


```
address: adb-12345.azuredatabricks.net
port: 443
organization: 6789
cluster: abcd
```

Excepting the port (443), the other values were set randomly just to show an example.

Then use the following function:


```console
library(loaddatabricks)
connection <- databricks_jdbc(address="adb-xxxx.azuredatabricks.net", port = "443", organization = "xxxx", cluster = "xxxx", token="xxxx")
```