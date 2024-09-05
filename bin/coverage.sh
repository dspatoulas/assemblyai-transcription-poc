#!/usr/bin/env bash

set -e

COVERAGE_DIR="src/ally_security/assistant/*"

if [[ -z "${ASSEMBLY_AI_TRANSCRIPTION_POC_HOME}" ]]; then
    if [[ -f find_home.sh ]]; then
        source find_home.sh
    else
        source bin/find_home.sh
    fi
fi

source "${ASSEMBLY_AI_TRANSCRIPTION_POC_HOME}/bin/setup_venv.sh"

PYTHONPATH="${VENV_HOME}/bin"
PYTHONPATH="${PYTHONPATH}:${ASSEMBLY_AI_TRANSCRIPTION_POC_HOME}/src" coverage run --rcfile="${ASSEMBLY_AI_TRANSCRIPTION_POC_HOME}/.coveragerc" -m pytest -v "${ASSEMBLY_AI_TRANSCRIPTION_POC_HOME}/src/test"

coverage report -m

coverage html --include "${COVERAGE_DIR}"
