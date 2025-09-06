FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/restic/caddy@v0.3.0

FROM caddy:2.10-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
