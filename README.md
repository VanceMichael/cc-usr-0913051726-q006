# 试制协同队列

Go 与 Gin 提供后端入口，PostgreSQL 保存试制记录，Redis 用于排程锁。Compose 会启动两个依赖，`/healthz` 可作为容器探针。

```bash
docker compose up --build
curl http://localhost:8080/healthz
```
