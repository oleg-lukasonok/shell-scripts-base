#!/bin/bash
# -------------------------------------------------------------------------------------
#
# PLACEHOLDER_COPYRIGHT
#
# PLACEHOLDER_LICENCE
#
# -------------------------------------------------------------------------------------

. ./.scripts/loggers/lib/--env-vars-reader.sh

. ./.scripts/base/lib/-export-env-variables-from-file-dot-env.sh

export LOCAL_OS_TYPE="darwin"
export LOCAL_CPU_TYPE="amd64"
export LOCAL_HOME_DIR=$(pwd)
export LOCAL_FILE_DOT_ENV=".env"

_base_exportEnvVarsFrom_fileDotEnv

export ENV_VAR_KEY=""
export ENV_VAR_VALUE=""

ALL_ARGS=("$@")
while [[ "$#" -gt 0 ]]; do
    case $1 in
    --local-os-type)
        export LOCAL_OS_TYPE="$2"
        ;;
    --local-cpu-type)
        export LOCAL_CPU_TYPE="$2"
        ;;
    --local-file-dot-env)
        export LOCAL_FILE_DOT_ENV="$2"
        ;;
    --env-var-key)
        export ENV_VAR_KEY="$2"
        ;;
    --env-var-value)
        export ENV_VAR_VALUE="$2"
        ;;
    *) ;;
    esac
    shift
done
set -- "${ALL_ARGS[@]}"
