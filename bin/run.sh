#!/usr/bin/env bash

set -e

if [[ -z "${ASSEMBLY_AI_TRANSCRIPTION_POC_HOME}" ]]; then
    if [[ -f find_home.sh ]]; then
        source find_home.sh
    else
        source bin/find_home.sh
    fi
fi

if [[ -z "${VENV_HOME}" ]]; then
  source "${ASSEMBLY_AI_TRANSCRIPTION_POC_HOME}/bin/setup_venv.sh"
else
  echo "VENV_HOME: ${VENV_HOME}"
fi

echo "Activating VENV_HOME from location ${VENV_HOME}"

source "${VENV_HOME}/bin/activate"

# Export the secret environments variables from .env file
if [[ -f "${ASSEMBLY_AI_TRANSCRIPTION_POC_HOME}/.env" ]]; then
  set -o allexport && source .env && set +o allexport
fi

PYTHONPATH="${PYTHONPATH}:${ASSEMBLY_AI_TRANSCRIPTION_POC_HOME}/src" python3 "${ASSEMBLY_AI_TRANSCRIPTION_POC_HOME}/src/main.py" "$@"
