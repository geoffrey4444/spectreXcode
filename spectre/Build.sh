#! /bin/bash
# This script builds SpECTRE on macOS. It requires that you define these
# build settings in your build target:
# SPECTRE_ROOT
# CHARM_ROOT
# SPACK_ROOT

echo "Start build on $(date)"

# Load spack
echo "Loading spack..."
export PATH=$SPECTRE_SPACK_ROOT/bin:$PATH
. $SPECTRE_SPACK_ROOT/share/spack/setup-env.sh

# Load modules
echo "Loading modules..."
module load blaze-3.2-clang-9.1.0-apple-e5gy4ym
module load boost-1.67.0-clang-9.1.0-apple-kohlnxv
module load brigand-master-clang-9.1.0-apple-bh37nic
module load bzip2-1.0.6-clang-9.1.0-apple-73vi2er
module load catch-2.2.1-clang-9.1.0-apple-khmdqwh
module load cmake-3.11.2-clang-9.1.0-apple-i7j2ydj
module load gsl-2.4-clang-9.1.0-apple-j7hbrgg
module load hdf5-1.10.2-clang-9.1.0-apple-rmorpf5
module load jemalloc-4.5.0-clang-9.1.0-apple-y3jnwi4
module load libxsmm-1.9-clang-9.1.0-apple-evgxd6r
module load ncurses-6.1-clang-9.1.0-apple-y43rifz
module load openssl-1.0.2n-clang-9.1.0-apple-htziakl
module load pkgconf-1.4.2-clang-9.1.0-apple-564r23i
module load yaml-cpp-develop-clang-9.1.0-apple-adpn6bj
module load zlib-1.2.11-clang-9.1.0-apple-jgaeca4
module load doxygen-1.8.12-clang-9.1.0-apple-yosy72f

echo "Building in ${BUILD_ROOT}"
cd $BUILD_ROOT
make -j 2 test-executables

