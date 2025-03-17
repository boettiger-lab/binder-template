
# consider making these sticky / global.  Will make all configs transient
XDG_CONFIG_HOME=/opt/config
XDG_BIN_HOME=/opt/bin
# Also must create these directories and fix permissions.
sudo mkdir /opt/config && mkdir /opt/bin
sudo chown -R ${NB_USER}:users /opt/config /opt/bin

# additional Path MUST be set in Dockerfile
PATH=${XDG_BIN_HOME}:$PATH

# install uv to XDG-compliant location, does not need root
curl -LsSf https://astral.sh/uv/install.sh | sh
