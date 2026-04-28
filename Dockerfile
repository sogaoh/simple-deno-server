FROM denoland/deno:2.7.13

WORKDIR /app
USER deno

COPY deno.json .
COPY main.ts .

RUN deno compile --allow-net --allow-env --output /app/server main.ts

EXPOSE 8080

CMD ["/app/server"]
