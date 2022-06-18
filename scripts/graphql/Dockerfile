FROM golang

RUN apt-get update && apt-get install -y unzip wget git

ENV PROTO_RELEASE=protoc-21.1-linux-x86_64

RUN wget -q https://github.com/protocolbuffers/protobuf/releases/download/v21.1/${PROTO_RELEASE}.zip && \
  unzip ${PROTO_RELEASE}.zip -d protoc-release && \
  mv protoc-release/bin/* /usr/bin && \
  mv protoc-release/include/* /usr/include && \
  rm -rf ${PROTO_RELEASE}.zip protoc-release

RUN git clone https://github.com/opendoor-labs/protoc-gen-graphql.git && \
  cd protoc-gen-graphql && \
  go build -o protoc-gen-graphql . && \
  mv protoc-gen-graphql /usr/bin && \
  cd .. && \
  rm -rf protoc-gen-graphql

RUN git clone https://github.com/googleapis/googleapis.git /googleapis

WORKDIR /workspace

COPY ./scripts/graphql/run.sh /build/run.sh

ENTRYPOINT [ "/build/run.sh" ]
