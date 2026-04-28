const port = Number(Deno.env.get("PORT") ?? "8080");

function json(body: unknown, status = 200) {
  return new Response(JSON.stringify(body, null, 2), {
    status,
    headers: {
      "content-type": "application/json; charset=utf-8",
    },
  });
}

Deno.serve({ port }, (req) => {
  const url = new URL(req.url);
  const now = new Date().toISOString();

  const responseBase = {
    service: "alb-sample-app",
    method: req.method,
    path: url.pathname,
    host: req.headers.get("host"),
    forwardedFor: req.headers.get("x-forwarded-for"),
    forwardedProto: req.headers.get("x-forwarded-proto"),
    traceId: req.headers.get("x-amzn-trace-id"),
    timestamp: now,
  };

  if (req.method === "GET" && url.pathname === "/healthz") {
    return json({
      ok: true,
      ...responseBase,
    });
  }

  if (req.method === "GET" && url.pathname === "/blue") {
    return json({
      route: "blue",
      message: "blue endpoint reached",
      ...responseBase,
    });
  }

  if (req.method === "GET" && url.pathname === "/green") {
    return json({
      route: "green",
      message: "green endpoint reached",
      ...responseBase,
    });
  }

  if (req.method === "GET" && url.pathname === "/") {
    return json({
      service: "alb-sample-app",
      endpoints: ["/healthz", "/blue", "/green"],
    });
  }

  return json(
    {
      error: "not found",
      ...responseBase,
    },
    404,
  );
});
