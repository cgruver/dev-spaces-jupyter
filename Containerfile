FROM --platform=linux/amd64 quay.io/cgruver0/che/workspace-base:no-userns

USER 0

# Install bzip2 (needed to extract micromamba tarball) and micromamba
RUN dnf install -y bzip2 && dnf clean all \
    && curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj -C /usr/local bin/micromamba

# Create a shared prefix writable for arbitrary UID (Dev Spaces)
ENV MAMBA_ROOT_PREFIX=/opt/micromamba
RUN mkdir -p /opt/micromamba && chmod -R 0777 /opt/micromamba

# Install R + the R Jupyter kernel from conda-forge
RUN micromamba install -y -n base -c conda-forge \
      r-base r-irkernel \
    && micromamba clean -a -y

# Make the installed env accessible
RUN chmod -R 0777 /opt/micromamba

USER 10001
