FROM rocker/binder

XDG_CONFIG_HOME=/opt/config
XDG_BIN_HOME=/opt/bin
PATH=${XDG_BIN_HOME}:$PATH

# Also must create these directories and fix permissions.
RUN sudo mkdir /opt/config && sudo mkdir /opt/bin && \
    sudo chown -R ${NB_USER}:users /opt/config /opt/bin

# Add uv
RUN curl -LsSf https://astral.sh/uv/install.sh | sh

## Add pixi
RUN curl -fsSL https://pixi.sh/install.sh | PIXI_HOME=/opt/share/pixi bash

COPY environment.yml /tmp/environment.yml
RUN conda update --all --solver=classic -n base -c conda-forge conda && conda env update --file /tmp/environment.yml

# Config will be populated by env vars and moved to HOME via start script: (hub-dependent)
COPY continue/config.json /opt/share/continue/config.json
COPY continue/config.ts /opt/share/continue/config.ts
COPY start.sh /opt/share/start.sh

