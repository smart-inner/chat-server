BINARY_DIR = ${CURDIR}/bin

include Makefile.common

build:
	@echo "build chat-server start."
	$(GOBUILD) -o ${BINARY_DIR}/chat-server ${CURDIR}/*.go
	@echo "build chat-server successfully."

image:
	@echo "build image start."
ifeq ($(OS), osx)
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 $(GOBUILD) -o ${BINARY_DIR}/chat-server ${CURDIR}/*.go
else
	$(GOBUILD) -o ${BINARY_DIR}/chat-server ${CURDIR}/*.go
endif
	docker build -t registry.us-west-1.aliyuncs.com/smart-ai-chat/ai-chat:v1.0.1 .
	@echo "build image successfully."