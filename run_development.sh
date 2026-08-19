#!/bin/bash

CURRENT_PATH="$(pwd)"
PDFGEN_VERSION=1.0.20


docker pull ghcr.io/navikt/pdfgenrs:$PDFGEN_VERSION
docker run \
        -v $CURRENT_PATH/templates:/app/templates \
        -v $CURRENT_PATH/fonts:/app/fonts \
        -v $CURRENT_PATH/data:/app/data \
        -v $CURRENT_PATH/resources:/app/resources \
        -p 8081:8080 \
        -e DEV_MODE=true \
        -it \
        --rm \
        ghcr.io/navikt/pdfgenrs:$PDFGEN_VERSION
