
RUN <<EOF
  apt-get install -y curl ca-certificates apt-transport-https \
  ca-certificates curl software-properties-common \
  docker-ce docker-compose
EOF
