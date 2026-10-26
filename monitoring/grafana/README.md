# Dashboards n8n para InfluxDB

Port dos dashboards de [n8n-observability](https://github.com/n8n-io/n8n-observability/tree/main/dashboards/grafana) para InfluxDB 2 (Flux), mesmos painéis e layout:

| Arquivo | Origem | Métricas usadas |
|---|---|---|
| `n8n-webhook-executions-influxdb.json` | n8n-webhook-executions | `n8n_webhook_request_duration_seconds_*`, `n8n_workflow_info` |
| `n8n-form-executions-influxdb.json` | n8n-form-executions | `n8n_form_submission_duration_seconds_*`, `n8n_workflow_info` |
| `n8n-poll-triggers-influxdb.json` | n8n-poll-triggers | `n8n_poll_trigger_*`, `n8n_scheduler_*` |
| `n8n-scheduler-influxdb.json` | n8n-scheduler | `n8n_scheduler_*` |
| `n8n-system-tasks-influxdb.json` | n8n-system-tasks | `n8n_system_task_*` |

Diferenças em relação ao original:
- O filtro "Main instance" usa a tag `url` do Telegraf (o `instance` do Prometheus não existe aqui).
- Webhook e form medem requests HTTP (sucesso = 2xx/3xx, falha = 4xx/5xx), sem depender de métricas de execução do worker.
- Cada métrica do n8n exige a variável de ambiente correspondente (`N8N_METRICS_INCLUDE_*`) e só aparece depois da primeira observação.

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
