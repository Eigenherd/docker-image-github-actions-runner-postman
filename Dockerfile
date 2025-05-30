FROM ubuntu:22.04

# Set environment variables
ENV RUNNER_VERSION=2.324.0

# Install required dependencies
RUN apt-get upgrade -y;
RUN apt-get update && \
    apt-get install -y curl jq git && \
    apt-get clean;

# Add NodeSource and install Node.js 18
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs;

RUN node --version;
RUN npm --version;

# Postman Newman
RUN npm install -g newman;
RUN newman --version

# Install Postman Newman HTML Extra
RUN npm install -g newman-reporter-htmlextra;
RUN npm list -g newman-reporter-htmlextra --depth=0

# Download and extract GitHub Actions Runner
RUN curl -L -o actions-runner.tar.gz https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar xzf actions-runner.tar.gz \
    && rm actions-runner.tar.gz

# Add entrypoint or your custom configuration here

# Example entrypoint
ENTRYPOINT ["./run.sh"]