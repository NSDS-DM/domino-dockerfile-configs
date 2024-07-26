# domino-dockerfile-configs
helper scripts to aid building custom environments


# Usage

In your docker file, you are going to want to download this repo and then use the install scripts for the tools you'd like to use.
Make sure you using the latest tag/release. **Do not use the develop branch.**
```bash
# Note: Make sure you are using the latest release if you'd like the latest version of the workspaces
# https://github.com/dominodatalab/workspace-configs/releases/latest
ARG GH_TOKEN='github_token'
RUN mkdir -p /var/opt/domino-dockerfile-configs && \
    wget -O /var/opt/domino-dockerfile-configs/install-seurat.sh \
    https://raw.githubusercontent.com/NSDS-DM/domino-dockerfile-configs/main/single-cell/install-seurat.sh && \
    chmod +x /var/opt/domino-dockerfile-configs/install-seurat.sh
RUN /var/opt/domino-dockerfile-configs/install-seurat.sh $GH_TOKEN
```

Or add a name,value key pair to the Environment variables section of environment definition (below Dockerfile Instruction, Pluggable Workspace Tools and 
Run Setup Scripts sections)

| Variable Name | Value |
| --- | --- |
| GH_TOKEN | github_token |
```bash
# Note: Make sure you are using the latest release if you'd like the latest version of the workspaces
# https://github.com/dominodatalab/workspace-configs/releases/latest
ARG GH_TOKEN    # variable is set by Domino during image build
RUN mkdir -p /var/opt/domino-dockerfile-configs && \
    wget -O /var/opt/domino-dockerfile-configs/install-seurat.sh \
    https://raw.githubusercontent.com/NSDS-DM/domino-dockerfile-configs/main/single-cell/install-seurat.sh && \
    chmod +x /var/opt/domino-dockerfile-configs/install-seurat.sh
RUN /var/opt/domino-dockerfile-configs/install-seurat.sh $GH_TOKEN
```

# Notes

currently, scripts do not check for unbound variables, e.g. do not differentiate between ./install.sh and ./install.sh <var1> <var2>
