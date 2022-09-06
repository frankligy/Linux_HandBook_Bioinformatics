## Guidance on how to install R pacakges

We use Rstudio, and make sure R is installed. Let's first go over some basic which will help us better understand how the installation works
and when encountering issues, how to quickly debug.

First, where is R installed and what is the version of R, also Rstudio version can be found by the top bar (About Rstudio).

```R
R.home()

[1] "/Library/Frameworks/R.framework/Resources"

sessionInfo()

R version 4.1.0 (2021-05-18)
Platform: x86_64-apple-darwin17.0 (64-bit)
Running under: macOS Big Sur 11.6.3

Matrix products: default
LAPACK: /Library/Frameworks/R.framework/Versions/4.1/Resources/lib/libRlapack.dylib

locale:
[1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

loaded via a namespace (and not attached):
[1] compiler_4.1.0 tools_4.1.0 
```

Then, where are the base R dependencies were installed? You can see the path of each installed package in the resultant dataframe (`/Library/Frameworks/R.framework/Versions/4.1/Resources/library`). As you can see, dependencies installed in each R version won't conflict with each other. A separate note is, if using anaconda, the R packages should be in (`/opt/anaconda3/envs/cytospace/lib/R/library`)

```R
df <- installed.packages()
```

Now the recommendation is always open a new `renv` environment to create a new project. I usually create a folder called `R_envs` under my home directory and put my new environment in it for better management. After that, your working directory should be something like below, imagine the env name we created is called `clustree_env`.

```R
getwd()
[1] "/Users/ligk2e/R_envs/clustree_env"
```

We can start to install packages in this specific environment now, there are a few ways we usually use:

```R
# direct install, usually packages in CRAN
install.packages("clustree")
# through BiocManager
install.packages("BiocManager")
BiocManager::install("SummarizedExperiment")
# through devtools
install.packages('devtools')
devtools::install_github('YingMa0107/CARD')
# through remotes
install.packages("remotes")
remotes::install_github("lazappi/clustree@develop")
```

My suggestion is never compile or update for any prompted messages. After installation, check the `installed.pacakges()` again to verify the package has been installed. Now you can see the installed packages are in `/Users/ligk2e/R_envs/clustree_env/renv/library/R-4.1/x86_64-apple-darwin17.0`. As you can see, it resides in the `cluster_env` folder now.


## Troubleshooting

### 1. Version conflict of a already installed packages either in renv environment or base environment

```R
# example1
Error : 'on_load' is not an exported object from 'namespace:rlang'
Error: unable to load R code in package ‘tidygraph’
Execution halted

# example2
Error: package ‘cpp11’ 0.3.1 was found, but >= 0.4.2 is required by ‘tweenr’
```

Here, we just need to update `rlang` or `cpp11` installed in base environment. Remember, sometimes re-install only 
modify the one in the renv not in the base (the one in the base may appear as package.1 when viewed as R doesn't allow duplicated index), so you may need to first `remove.packages(package,path/to/base_dir)` then re-install, and re-start the session if necessary.







