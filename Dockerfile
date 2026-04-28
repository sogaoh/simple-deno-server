FROM denoland/deno:2.7.13

WORKDIR /app
USER deno

COPY deno.json .
COPY main.ts .

RUN deno cache main.ts

EXPOSE 8080

CMD ["run", "--allow-net", "--allow-env", "main.ts"]
