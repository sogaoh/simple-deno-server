# simple-deno-server

A minimal HTTP server built with [Deno](https://deno.com/), designed as a sample app for AWS ALB routing (blue/green deployments).

## Endpoints

| Method | Path | Description |
|--------|------|-------------|
| GET | `/` | List available endpoints |
| GET | `/healthz` | Health check |
| GET | `/blue` | Blue route |
| GET | `/green` | Green route |

All responses are JSON and include request metadata (method, path, host, `x-forwarded-for`, `x-forwarded-proto`, `x-amzn-trace-id`).

## Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `PORT` | `8080` | Port to listen on |

## Usage

### Local (Deno)

```bash
deno task dev
```

### Docker Compose (via Make)

| Command | Description |
|---------|-------------|
| `make up` | Start containers (foreground) |
| `make upd` | Start containers (detached) |
| `make upb` | Build and start containers (detached) |
| `make down` | Stop and remove containers |
| `make restart` | Restart containers |
| `make prune` | Remove unused Docker resources (volumes included) |
| `make cleanup` | Full Docker cleanup (images, cache, volumes) |

The app listens on port `8080` inside the container, mapped to `18080` on the host. Includes a health check against `/healthz`.

> The image uses `deno compile` to produce a self-contained binary, so it works with `readOnlyRootFileSystem: true` on ECS Fargate.
