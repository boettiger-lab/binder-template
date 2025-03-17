FROM rocker/binder

ENV XDG_CONFIG_HOME=/opt/config
ENV XDG_BIN_HOME=/opt/bin
ENV PATH = ${XDG_BIN_HOME}:$PATH
USER root
RUN mkdir /opt/config && mkdir /opt/bin
RUN chown -R ${NB_USER}:users /opt/config /opt/bin

USER ${NB_USER}

RUN curl -LsSf https://astral.sh/uv/install.sh | sh


# COPY environment.yml /tmp/environment.yml
# RUN conda update -n base -c conda-forge conda && conda env update --file environment.yml
# RUN conda update --all --solver=classic -n base -c conda-forge conda && conda env update --file /tmp/environment.yml

# Config will be populated by env vars and moved to HOME via start script: (hub-dependent)
COPY continue/config.json /opt/share/continue/config.json
COPY continue/config.ts /opt/share/continue/config.ts
COPY start.sh /opt/share/start.sh

