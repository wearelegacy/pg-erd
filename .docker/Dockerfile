FROM golang:1.19 AS Builder

ARG PLANTER_VERSION

RUN CGO_ENABLED=0 go install \
    --ldflags '-extldflags "-static"' \
    github.com/achiku/planter@${PLANTER_VERSION}

FROM python:3.9-alpine

ARG PYTHON_PLANTUML_VERSION

RUN apk add --no-cache \
        util-linux

RUN pip install \
        six \
        plantuml==${PYTHON_PLANTUML_VERSION}

COPY --from=Builder /go/bin/planter /usr/bin/
COPY pg-erd /usr/bin/

ENTRYPOINT [ "/usr/bin/pg-erd" ]

CMD [ "help" ]
