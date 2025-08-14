FROM caddy:builder AS builder

RUN xcaddy build \
    --with github.com/caddy-dns/cloudflare \
	--with github.com/caddyserver/transform-encoder \
	--with github.com/hslatman/caddy-crowdsec-bouncer/http@main \
	--with github.com/hslatman/caddy-crowdsec-bouncer/appsec@main \
	--with github.com/hslatman/caddy-crowdsec-bouncer/layer4@main

FROM caddy:2.10-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/
