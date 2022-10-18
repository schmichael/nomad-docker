FROM golang:1.19-alpine
RUN apk update
RUN apk add bash gcc git nodejs npm yarn make musl-dev linux-headers
WORKDIR /nomad
ENV CGO_ENABLED=1
RUN git clone https://github.com/hashicorp/nomad.git /nomad && \
  cd /nomad && \
  make bootstrap && \
  make prerelease
RUN cd /nomad && make dev-ui
