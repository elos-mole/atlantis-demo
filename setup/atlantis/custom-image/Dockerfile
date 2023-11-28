ARG ATLANTIS_VERSION=v0.26.0
FROM ghcr.io/runatlantis/atlantis:${ATLANTIS_VERSION}

ARG TERRAGRUNT_VERSION=v0.53.6
ADD --chmod=+x https://github.com/gruntwork-io/terragrunt/releases/download/${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 /usr/local/bin/terragrunt
RUN chmod +x /usr/local/bin/terragrunt

ARG TERRAGRUNT_ATLANTIS_CONFIG_VERSION=1.16.0
RUN curl -L -o terragrunt-atlantis-config.tar.gz https://github.com/transcend-io/terragrunt-atlantis-config/releases/download/v${TERRAGRUNT_ATLANTIS_CONFIG_VERSION}/terragrunt-atlantis-config_${TERRAGRUNT_ATLANTIS_CONFIG_VERSION}_linux_amd64.tar.gz \
    && tar -xvf terragrunt-atlantis-config.tar.gz \
    && mv terragrunt-atlantis-config_${TERRAGRUNT_ATLANTIS_CONFIG_VERSION}_linux_amd64/terragrunt-atlantis-config_${TERRAGRUNT_ATLANTIS_CONFIG_VERSION}_linux_amd64 /bin/terragrunt-atlantis-config \
    && rm terragrunt-atlantis-config.tar.gz && rm -rf terragrunt-atlantis-config_${TERRAGRUNT_ATLANTIS_CONFIG_VERSION}_linux_amd64/

ENV HOME=/home/atlantis
