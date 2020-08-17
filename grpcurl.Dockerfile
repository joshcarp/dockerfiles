FROM golang:1.14-buster
RUN go get -u -v github.com/fullstorydev/grpcurl/cmd/grpcurl
ENTRYPOINT ["grpcurl"]
