# conda commands

```bash
# create
conda create -n env python=3.7
conda create -p ./env python=3.7

# list all conda env
conda env list

# check the packages in one env
conda list -n env
conda list -n env sctriangulate

# activate
conda activate env
source activate env

# remove
conda remove -n env scipy
conda remove -n env --all

# deactivate
conda deactivate # to exit base, need to deactivate twice

# check the available channels
conda config --show channels
conda config -add channels bioconda

# install from certain channel
conda install -c bioconda scanpy

# pip install (make sure using the write pip and matched with the python interpretator)
pip install sctriangulate
python3.7 -m pip install sctriangulate
pip install --upgrade sctriangulate
pip uninstall sctriangulate

```







