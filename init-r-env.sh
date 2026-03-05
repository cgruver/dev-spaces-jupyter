if [[ ! -f ${PROJECTS_ROOT}/.r-kernel-installed ]]
then
  export PATH=/opt/micromamba/bin:${PATH}
  Rscript -e "IRkernel::installspec(user = TRUE, name = 'ir', displayname = 'R')"
  touch ${PROJECTS_ROOT}/.r-kernel-installed
fi
