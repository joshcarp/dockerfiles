FROM golang:1.14-buster as installer
RUN go get -u -v github.com/ofabry/go-callvis
FROM graphviz/graphviz:ubuntu-20.10
COPY --from=installer /go/bin/go-callvis /bin/go-callvis
WORKDIR /usr/app
ENTRYPOINT ["go-callvis"]