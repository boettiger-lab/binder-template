FROM rocker/binder

ENV XDG_CONFIG_HOME=/opt/config
ENV XDG_BIN_HOME=/opt/bin
ENV PATH=${XDG_BIN_HOME}:$PATH

# Also must create these directories and fix permissions.
RUN sudo mkdir /opt/config && sudo mkdir /opt/bin && \
    sudo chown -R ${NB_USER}:users /opt/config /opt/bin

# Config will be populated by env vars and moved to HOME via start script: (hub-dependent)
COPY continue/config.json /opt/share/continue/config.json
COPY continue/config.ts /opt/share/continue/config.ts


# defaults, can be overridden with normal `--global` settings
RUN git config --system user.name jovyan && \
    git config --system user.email jovyan@jupyter.org && \
    git config --system pull.rebase false

COPY environment.yml /tmp/environment.yml
RUN conda update --all --solver=classic -n base -c conda-forge conda && conda env update --file /tmp/environment.yml

COPY spatial-env.yml /tmp/spatial-env.yml
RUN conda update --all --solver=classic -n base -c conda-forge conda && conda env update --file /tmp/spatial-env.yml
