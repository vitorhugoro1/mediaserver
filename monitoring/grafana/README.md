# n8n Webhook Executions (InfluxDB)

Adaptação do dashboard [n8n-webhook-executions](https://github.com/n8n-io/n8n-observability/tree/main/dashboards/grafana/n8n-webhook-executions) para InfluxDB 2 (Flux).

## Coleta (Telegraf)

O n8n precisa de `N8N_METRICS`, `N8N_METRICS_INCLUDE_WEBHOOK_METRICS` e `N8N_METRICS_INCLUDE_WORKFLOW_INFO` (já em `docker-compose.n8n.yml`). O Telegraf raspa o `/metrics` e grava no bucket `home`:

```toml
[[inputs.prometheus]]
  urls = ["http://localhost:5678/metrics"]
  metric_version = 2   # obrigatório: um field por série, tag "le" nos buckets
  name_override = "n8n"  # measurement próprio, não mistura com outros inputs.prometheus

[[outputs.influxdb_v2]]
  urls = ["http://localhost:8086"]
  token = "$INFLUX_TOKEN"
  organization = "docs"
  bucket = "home"
```

## Importar

1. Grafana → Connections → Data sources → InfluxDB, com **Query language: Flux**, org `docs`, bucket `home`.
2. Dashboards → Import → `n8n-webhook-executions-influxdb.json` e escolha o datasource.
3. Outro bucket? Edite a variável constante `bucket` no JSON.
