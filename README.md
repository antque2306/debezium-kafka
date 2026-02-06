## Đăng ký Debezium Connector cho Postgre
curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d '{
  "name": "pg-connector",
  "config": {
    "connector.class": "io.debezium.connector.postgresql.PostgresConnector",
    "plugin.name": "pgoutput",
    "database.hostname": "postgres",
    "database.port": "5432",
    "database.user": "admin_postgres",
    "database.password": "password_postgres",
    "database.dbname": "inventory_db_postgres",
    "topic.prefix": "pg_db",
    "table.include.list": "public.customers"
  }
}'

## Delete connector postgre
curl -X DELETE localhost:8083/connectors/pg-connector

## Đăng ký Debezium Connector cho MySQL
curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d '{
  "name": "mysql-connector_v2",
  "config": {
    "connector.class": "io.debezium.connector.mysql.MySqlConnector",
    "database.hostname": "mysql",
    "database.port": "3306",
    "database.user": "root",
    "database.password": "password_mysql_root",
    "database.server.id": "184055",
    "topic.prefix": "mysql_db",
    "database.include.list": "inventory_db_mysql",
    "schema.history.internal.kafka.bootstrap.servers": "kafka:9092",
    "schema.history.internal.kafka.topic": "schema-changes.mysql",
    "include.schema.changes": "true",
    "database.history.skip.unparseable.ddl": "true",
    "database.allowPublicKeyRetrieval": "true",
    "database.ssl.mode": "disabled",
    "snapshot.mode": "initial"
  }
}'

## Delete connector mysql
curl -X DELETE localhost:8083/connectors/mysql-connector

