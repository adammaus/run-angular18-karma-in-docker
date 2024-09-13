FROM --platform=linux/amd64 ubuntu:noble
#--platform is necessary to install Chrome

# Install base software (some of these are likely unnecessary)
RUN apt-get update -y \
    && apt-get install -y \
    apt-utils \
    bash \
    libfreetype6-dev \
    libmcrypt-dev \
    libbz2-dev \
    libxslt-dev \
    libldap2-dev \
    git \
    wget \
    openssh-client \
    ca-certificates \
    curl \
    gnupg \
    build-essential \
    software-properties-common \
    locales locales-all \
    openssl \
    mcrypt \
    jq \
    unattended-upgrades

# Install Node and NPM
ENV NODE_MAJOR=20 \
    PATH=$PATH:/opt/node/bin

WORKDIR /opt/node

RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list

RUN apt-get update -y \
    && apt-get install -y nodejs

# Install Chrome
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install -y ./google-chrome-stable_current_amd64.deb

# Install Angular 18
RUN npm install -g @angular/cli@18

# Copy app to container and move to it
ADD . /usr/src
WORKDIR /usr/src/app

# Install app dependencies
RUN npm install