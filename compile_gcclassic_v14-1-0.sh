#!/bin/bash -l

# Short script to compile GEOS-Chem v14.1.0 using CMake.

# Settings for batch job on UCL Legion:
#$ -pe smp 6
#$ -l h_rt=0:20:0
#$ -l mem=1G
#$ -N make_v14-1-0
#$ -j y
#$ -cwd
#$ -P hpc.10
#$ -l paid=1

# Initialize relevant libraries:
source ~/.bashrc_gc

# Point to modules for compiling model interactively:
#source /etc/profile.d/modules.sh

# Clear module list to avoid conflicts:
#module purge
# Load CMake module (also load git module to avoid compile error, although executable is generated despite compile error).
#module load /lustre/projects/uptrop/spack/share/spack/modules/linux-rhel7-skylake_avx512/cmake-3.19.1-gcc-9.2.0-ybzfmot
#module load /lustre/projects/uptrop/spack/share/spack/modules/linux-rhel7-skylake_avx512/git-2.29.0-gcc-9.2.0-m4xwuzi

#spack load cmake
#spack load git

#spack find --loaded

# Move to build directory:
rm -r build build_info
mkdir build build_info
cd build

# Initialize the build directory
cmake ../CodeDir -DRUNDIR=..

# Reconfigure run directory using CMake with the -DRUNDIR option:
# This is set relative to the build directory. You can also define the
# full path of the run directory:
# Compile with RRTMG
cmake . -DRUNDIR=../

# compile GEOS-Chem over 6 cores and pipe the output to a log file:
make -j6 > ../logs/log_gc_compile_alumina

# Install the executable (named gcclassic) to your run directory with make and append output to existing log file created above:
make install >> ../logs/log_gc_compile_alumina

exit
