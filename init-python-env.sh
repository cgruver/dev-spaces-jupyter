if [[ ! -d ${PROJECTS_ROOT}/.venv ]]
then 
  python3 -m venv --copies ${PROJECTS_ROOT}/.venv
  source ${PROJECTS_ROOT}/.venv/bin/activate
  pip install --upgrade pip
  pip install ipydatagrid pandas jupyterlab ipykernel  
fi