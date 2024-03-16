#!/bin/bash
# -------------------------------------------------------------------------------------
#
# PLACEHOLDER_COPYRIGHT
#
# PLACEHOLDER_LICENCE
#
# -------------------------------------------------------------------------------------

. ./.scripts/loggers/lib/--index-api.sh

. ./.scripts/base/lib/-export-env-variable.sh

. ./.scripts/base/lib/-local-storage-save-env-variable-2-file-dot-env.sh

. ./.scripts/base/lib/-local-storage-read-lines-from-file.sh

_base_ensure_evnVar_localOSType() {
  local FUNCTION_NAME="_base_ensure_evnVar_localOSType"
  _loggers_debug "${FUNCTION_NAME}"

  if
    [ -z "${LOCAL_OS_TYPE}" ]
  then

    local LOCAL_OS_TYPES=$(
      _base_localStorage_readLinesFrom_file ".scripts/base/suggestions/os-types"
    )

    echo "${LOCAL_OS_TYPES}"

    local TMP_LOCAL_OS_TYPE=""

    while
      true
    do

      _loggers_info "${FUNCTION_NAME}" "Select local os type."

      _loggers_emptyLine
      select LOCAL_OS_TYPE_SELECTED in $LOCAL_OS_TYPES; do
        case $LOCAL_OS_TYPE_SELECTED in
        exit)
          local TMP_LOCAL_OS_TYPE=""
          break
          ;;
        *)
          local TMP_LOCAL_OS_TYPE="${LOCAL_OS_TYPE_SELECTED}"
          break
          ;;
        esac
      done
      _loggers_emptyLine

      if
        [ ! -z "${TMP_LOCAL_OS_TYPE}" ]
      then
        _base_exportEnvVariable "LOCAL_OS_TYPE" "${TMP_LOCAL_OS_TYPE}"

        local ENV_VAR_KEY="LOCAL_OS_TYPE"
        local ENV_VAR_VALUE="${TMP_LOCAL_OS_TYPE}"

        _base_localStorage_saveEnvVariable2_fileDotEnv
        break
      fi
    done
  fi
}
