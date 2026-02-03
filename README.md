## Đăng ký Debezium Connector
curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d '{
  "name": "inventory-connector",
  "config": {
    "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
    "plugin.name": "pgoutput",
    "database.hostname": "postgres",
    "database.port": "5432",
    "database.user": "thinh_admin",
    "database.password": "password",
    "database.dbname": "inventory_db",
    "topic.prefix": "dbserver1",
    "table.include.list": "public.customers",
    "topic.creation.default.replication.factor": "1",
    "topic.creation.default.partitions": "1"
  }
}'
