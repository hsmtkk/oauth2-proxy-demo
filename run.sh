#!/bin/sh
./oauth2-proxy.bin --client-id b61dd147a74a976f6952 \
 --client-secret 2eed666aea2ac3ef6ea262c6ec408eabbe39f1af \
 --cookie-secret 0123456789abcdef \
 --email-domain '*' \
 --https-address :8443 \
 --pass-access-token true \
 --provider github \
 --tls-cert-file ./cert.pem \
 --tls-key-file ./key.pem \
 --upstream http://127.0.0.1:8080
