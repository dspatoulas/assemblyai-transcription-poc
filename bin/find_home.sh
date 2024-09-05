#!/usr/bin/env bash

set -e

if [[ -z "${ASSEMBLY_AI_TRANSCRIPTION_POC_HOME}" ]]; then

    echo "Trying to locate ASSEMBLY_AI_TRANSCRIPTION_POC_HOME"

    while [[ ${PWD} != "/" ]]; do

        echo "Checking path ${PWD}"

        if [[ -f "${PWD}/pyproject.toml" ]]; then
            PROJECT_NAME=$(yq -p toml -o json < "${PWD}/pyproject.toml" | jq -r '.tool.poetry.name')
            ASSEMBLY_AI_TRANSCRIPTION_POC_HOME="${PWD}"
            echo "Found ${PROJECT_NAME} at ${ASSEMBLY_AI_TRANSCRIPTION_POC_HOME}"
            export ASSEMBLY_AI_TRANSCRIPTION_POC_HOME
            break
        else
            echo "Unable to find home in this directory, moving one directory up"
            pushd ../
        fi

    done

    if [[ -z "${ASSEMBLY_AI_TRANSCRIPTION_POC_HOME}" ]]; then
        echo "Unable to locate ASSEMBLY_AI_TRANSCRIPTION_POC_HOME"
        exit 1
    fi

else
    echo "ASSEMBLY_AI_TRANSCRIPTION_POC_HOME already set to ${ASSEMBLY_AI_TRANSCRIPTION_POC_HOME}"
fi
