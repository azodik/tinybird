# Install Tiny bird CLI

```bash
# For Mac and Linux
curl https://tinybird.co | sh

# For Windows
powershell -ExecutionPolicy ByPass -c "irm https://tinybird.co | iex"
```


## Local

```bash
tb deploy
````

## generate fixtures

```bash
tb mock audit_logs --rows=1000
```

## Apply fixtures

```bash
tb datasource append audit_logs --file fixtures/audit_logs.ndjson
```

if deleted something

```bash
tb deploy --allow-destructive-operations
```

## Push to cloud

```bash
tb deploy --cloud
```


# API ENDPOINTS

- Ingest Audit Log

```bash
curl --location '{TB_URL}/v0/events?name=audit_logs' \
--header 'Authorization: Bearer {TB_TOKEN}' \
--header 'Content-Type: text/plain' \
--data '{"id":"a1b2c3d4e5233434","timestamp":"2025-08-13T12:34:56.789Z","tenant_id":"faf304f42350c0ba1236f5ccdefbea59","app_id":"NA","product_slug":"authzio","action":"USER_LOGIN","actor_id":"faf304f42350c0ba1236f5ccdefbea591","actor_type":"tenant","actor_name":"John Doe","targets":"faf304f42350c0ba1236f5ccdefbea59","description":"User John Doe logged into CRM Suite","ip_address":"203.0.113.45","user_agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Safari/537.36","meta_data":"{}"}
'
```


- Get all logs
```bash
curl --location '{TB_URL}/v0/pipes/get_audit_logs.json?start=2024-06-01+00%3A00%3A00&end=2025-08-07+00%3A00%3A00&tenant_id=tenant_002&limit=10&page=1&action=null' \
--header 'Authorization: Bearer {TB_TOKEN}'
```


- Get By tenant id

```bash
curl --location '{TB_URL}/v0/pipes/get_audit_logs_by_tenant_id.json?start=2024-06-01&end=2024-06-07&tenant_id=faf304f42350c0ba1236f5ccdefbea59&limit=1&page=1&actor_id=faf304f42350c0ba1236f5ccdefbea59' \
--header 'Authorization: Bearer {TB_TOKEN}'
```

- Get By actor id

```bash
curl --location '{TB_URL}/v0/pipes/get_audit_logs_by_actor_id.json?start=2024-06-01&end=2024-06-01&tenant_id=faf304f42350c0ba1236f5ccdefbea59&limit=1&page=1&actor_id=250138e1-e7ad-4bc2-bdd8-7494e214345f' \
--header 'Authorization: Bearer {TB_TOKEN}'
```

- Count Audit Log actions

```bash
curl --location '{TB_URL}/v0/pipes/count_audit_logs_by_action.json?tenant_id=faf304f42350c0ba1236f5ccdefbea59&action=USER_LOGIN%2CUSER_SIGNUP' \
--header 'Authorization: Bearer {TB_TOKEN}'
```

- Count MAU Users

```bash
curl --location '{TB_URL}/v0/pipes/count_mau_users.json?start=2025-08-01&end=2025-08-31&tenant_id=faf304f42350c0ba1236f5ccdefbea59' \
--header 'Authorization: Bearer {TB_TOKEN}'
```