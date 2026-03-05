FROM --platform=linux/amd64 quay.io/cgruver0/che/workspace-base:no-userns

USER 0

ENV MAMBA_ROOT_PREFIX=/opt/micromamba

# Install R + R Jupyter kernel in a single layer to minimize image size
RUN dnf install -y bzip2 && dnf clean all \
    && curl -Ls https://micro.mamba.pm/api/micromamba/linux-64/latest | tar -xvj -C /usr/local bin/micromamba \
    && mkdir -p /opt/micromamba \
    && micromamba install -y -n base -c conda-forge \
         r-base r-irkernel \
    && micromamba clean -a -y \
    && rm -f /usr/local/bin/micromamba \
    && dnf remove -y bzip2 && dnf clean all \
    && chmod -R 0777 /opt/micromamba

USER 10001
