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
