FROM optum-docker.repo1.uhc.com/dsi/alpine:3.16.2
RUN apk update && apk add bash
RUN wget https://releases.hashicorp.com/terraform/1.2.8/terraform_1.2.8_linux_amd64.zip
RUN unzip terraform_1.2.8_linux_amd64.zip && rm terraform_1.2.8_linux_amd64.zip
RUN mv terraform /usr/bin/terraform
RUN apk add git
RUN apk add py3-pip
RUN apk add gcc musl-dev python3-dev libffi-dev openssl-dev cargo make
RUN pip install --upgrade pip
RUN pip install azure-cli
RUN cd /usr/local/share/ca-certificates && wget https://repo1.uhc.com/artifactory/UHG-certificates/optum/Optum_Root_CA.cer && mv Optum_Root_CA.cer Optum_Root_CA.crt && update-ca-certificates
CMD sh
