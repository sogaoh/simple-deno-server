FROM denoland/deno:2.7.13

WORKDIR /app

COPY deno.json .
COPY main.ts .

RUN deno compile --allow-net --allow-env --output /app/server main.ts

USER deno

EXPOSE 8080

CMD ["/app/server"]
