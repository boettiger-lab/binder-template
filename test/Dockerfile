FROM ghcr.io/mamba-org/micromamba
# User is `mambauser`

RUN micromamba install \
  --channel conda-forge \
  --yes \
  "jupyterhub==4.*" \
  notebook

#CMD ["jupyter", "lab", "--ip", "0.0.0.0"]

