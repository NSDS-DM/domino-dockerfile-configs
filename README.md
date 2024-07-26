# domino-dockerfile-configs
helper scripts to aid building custom environments


# Usage

## Setup

In your docker file, you are going to want to download this repo and then use the install scripts for the tools you'd like to use.
Make sure you using the latest tag/release. **Do not use the develop branch.**
```bash
# Note: Make sure you are using the latest release if you'd like the latest version of the workspaces
# https://github.com/dominodatalab/workspace-configs/releases/latest
RUN mkdir -p /var/opt/domino-dockerfile-configs && \
    wget -O /tmp/main.zip \
        https://github.com/NSDS-DM/domino-dockerfile-configs/archive/refs/heads/main.zip && \
        unzip /tmp/main.zip -d /tmp && \
    cp -Rf /tmp/domino-dockerfile-configs-main/* /var/opt/domino-dockerfile-configs && \
    rm -rf /tmp/main.zip /tmp/domino-dockerfile-configs-main
```

## Setting access tokens or other variables

### Preferred option
Add a name,value key pair to the Environment variables section of environment definition (below Dockerfile Instruction, Pluggable Workspace Tools and 
Run Setup Scripts sections)

| Variable Name | Value |
| --- | --- |
| GH_TOKEN | github_token123ABC |

### Alternate option
Add to your Dockerfile instructions:
```bash
ARG GH_TOKEN=github_token123ABC
ARG GH_TOKEN='github_token123ABC'    # can quote value, but best to leave unqouted for consistency to GUI key,value option (preferred)
```

## Install

### Alternate option

Add the desired workspaces to your Dockerfile instructions:

```bash
# Install Seurat ecosystem
RUN chmod +x /var/opt/domino-dockerfile-configs/single-cell/install-seurat.sh && \
    /var/opt/domino-dockerfile-configs/single-cell/install-seurat.sh $GH_TOKEN

# Other
RUN chmod +x /var/opt/domino-dockerfile-configs/other-tools/install.sh && \
    /var/opt/domino-dockerfile-configs/other-tools/install.sh
```

# Notes

currently, scripts do not check for unbound variables, e.g. do not differentiate between ./install.sh and ./install.sh \<var1\> \<var2\>
