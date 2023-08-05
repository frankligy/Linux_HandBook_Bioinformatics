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
source activate env  # do it on cluster

# remove
conda remove -n env scipy
conda remove -n env --all

# deactivate
conda deactivate # to exit base, need to deactivate twice

# export
conda env export > environment.yml # make sure no prefix, and the name is just the name, no prefix
conda env create -f environment.yml -p ./name_env

# check the available channels
conda config --show channels
conda config -add channels bioconda

# install from certain channel
conda install -c bioconda scanpy

# pip install (make sure using the write pip and matched with the python interpretator)
unset PYTHONPATH    # make sure to not look for shared python folder
export PYTHONNOUSERSITE="literallyanyletters"   # make sure to not use user
pip install --no-cache-dir sctriangulate  
python3.7 -m pip install sctriangulate
pip install --upgrade sctriangulate
pip uninstall sctriangulate

# the major problem you will encoutner, is either complier issue, which requires you to update complier, or installation order issue, you have to do some calculations.


# mannual
pip install werkzeug==2.0.2
pip install dash==2.0.0 # which requires flask=2.2.5 (updated) which further require werkzeug>=2.2.2, here, manual fix is required, you may first set the flask version to be a lower version to make it compatiable with the werkzeug, sometimes pip install order also matters.



```



# mamba 

As you may notice, conda, when solving environment, can be super slow, sometimes even impossible, now you should use mamba, in Unix-based system, you are 
recommended to download mamba shell script (https://github.com/conda-forge/miniforge#mambaforge) and run it to install it. When I installed it on my Mac, it by default will be stored at /Users/ligk2e. From here, mamba is a drop-in replacement for conda when manipulating dependencies for the mamba-created environment.

When you need to switch to previously-installed conda environment, you need to use full environment path to activate them, and I prefer to use conda for manupulating previous environment.










