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

### Docker Compose

```bash
docker compose up --build
```

The app listens on port `8080` inside the container, mapped to `18080` on the host. Includes a health check against `/healthz`.
