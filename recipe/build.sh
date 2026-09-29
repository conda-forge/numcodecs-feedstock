#!/bin/bash
set -ex

export SETUPTOOLS_SCM_PRETEND_VERSION="${PKG_VERSION}"

# When cross-compiling, numpy-config can't be executed, so let meson find the
# host numpy through its pkg-config file instead.
export PKG_CONFIG_PATH="${SP_DIR}/numpy/_core/lib/pkgconfig${PKG_CONFIG_PATH:+:${PKG_CONFIG_PATH}}"

# AVX2 is disabled to keep binaries portable across x86_64 CPUs.
${PYTHON} -m pip install . -vv --no-deps --no-build-isolation \
    -Cbuilddir=builddir \
    -Csetup-args=-Davx2=disabled \
    ${MESON_ARGS:+-Csetup-args=${MESON_ARGS// / -Csetup-args=}}
