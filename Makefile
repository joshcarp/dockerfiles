grpcurl:
	docker build . -t joshcarp/grpcurl -f grpcurl.Dockerfile
grpcurl.push:
	docker push joshcarp/grpcurl
protoc:
	docker build . -t joshcarp/protoc -f protoc.Dockerfile
protoc.push:
	docker push joshcarp/protoc
