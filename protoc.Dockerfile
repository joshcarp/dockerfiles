FROM golang:1.14-buster
RUN apt-get update && apt-get  install -y \
    git \
    unzip \
    build-essential \
    autoconf \
    libtool \
    curl \
    && rm -rf /var/lib/apt/lists/*
ENV PROTOC_VERSION="3.20.1"
RUN curl -L -O https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_VERSION}/protoc-${PROTOC_VERSION}-linux-x86_64.zip
RUN apt-get update && apt-get install --assume-yes bash
RUN unzip protoc-${PROTOC_VERSION}-linux-x86_64.zip -d /usr/local/

WORKDIR /
RUN go get -u -v github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
RUN go get -u -v github.com/envoyproxy/protoc-gen-validate
RUN go get -u -v github.com/golang/protobuf/protoc-gen-go
RUN go get -u -v google.golang.org/protobuf/cmd/protoc-gen-go
RUN go get -u -v google.golang.org/grpc/cmd/protoc-gen-go-grpc
RUN go get -u -v github.com/twitchtv/twirp/protoc-gen-twirp
ADD https://github.com/grpc/grpc-web/releases/download/1.2.0/protoc-gen-grpc-web-1.2.0-linux-x86_64 /bin/protoc-gen-grpc-web
RUN chmod +x /bin/protoc-gen-grpc-web
ENTRYPOINT [ "protoc" ]
