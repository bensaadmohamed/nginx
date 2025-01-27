FROM nginx

RUN apt update && \
apt install libnss3-tools curl -y && \
curl -JLO "https://dl.filippo.io/mkcert/latest?for=linux/amd64" && \
chmod +x mkcert-v*-linux-amd64 && \
cp mkcert-v*-linux-amd64 /usr/local/bin/mkcert

RUN mkcert -install

RUN mkcert -key-file /root/key.pem -cert-file /root/cert.pem auth.expresaas.online
