FROM ubuntu:22.04

# Install required dependencies
RUN apt-get update && \
    apt-get install -y curl jq git nodejs npm && \
    apt-get clean

RUN node --version && npm --version

# Postman Newman
RUN npm install -g newman;
RUN newman --version

# Install Postman Newman HTML Extra
RUN npm install -g newman-reporter-htmlextra;
RUN npm list -g newman-reporter-htmlextra --depth=0

# Set environment variables
ENV RUNNER_VERSION=2.324.0

# Download and extract GitHub Actions Runner
RUN curl -L -o actions-runner.tar.gz https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar xzf actions-runner.tar.gz \
    && rm actions-runner.tar.gz

# Add entrypoint or your custom configuration here

# Example entrypoint
ENTRYPOINT ["./run.sh"]