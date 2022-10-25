FROM golang:1.19.2 AS Builder

ARG PLANTER_VERSION

RUN CGO_ENABLED=0 go install \
    --ldflags '-extldflags "-static"' \
    github.com/achiku/planter@${PLANTER_VERSION}

FROM scratch

COPY --from=Builder /go/bin/planter /

ENTRYPOINT [ "/planter" ]
