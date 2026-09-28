@echo on

set "SETUPTOOLS_SCM_PRETEND_VERSION=%PKG_VERSION%"

:: AVX2 is disabled to keep binaries portable across x86_64 CPUs.
%PYTHON% -m pip install . -vv --no-deps --no-build-isolation ^
    -Cbuilddir=builddir ^
    -Csetup-args=-Davx2=disabled
if %ERRORLEVEL% neq 0 exit 1
