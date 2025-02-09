#!/bin/sh
set -x
date

module purge
module load EnvVars/1.0.2
module load ips/18.0.1.163
module load lsf/10.1
module load impi/18.0.1
module load libpng/1.2.59
module load w3emc/2.3.0
module load w3nco/2.0.6
module load bacio/2.0.2
module load g2/3.1.0
module load zlib/1.2.11
module load jasper/1.900.1
module use -a /gpfs/dell1/nco/ops/nwpara/modulefiles/compiler_prod/ips/18.0.1

module load sigio/2.1.0
module load sfcio/1.0.0
module load sp/2.0.2
module load ip/3.0.1
module load NetCDF/3.6.3 
module load nemsio/2.2.3

cd ./gfs_gdas_gldas_precip.fd
rm -rf gfs_gdas_gldas_precip
make -f gfs_gdas_gldas_precip.makefile

cd ../gfs_gdas_gldas_gldas2gdas.fd
rm -rf gfs_gdas_gldas_gldas2gdas
make -f gfs_gdas_gldas_gldas2gdas.makefile

cd ../gfs_gdas_gldas_rst.fd
rm -rf gfs_gdas_gldas_rst
make -f gfs_gdas_gldas_rst.makefile

cd ../gfs_gdas_gldas_LIS.fd
sh compile.sh

cd ..
date

