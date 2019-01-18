#!/bin/bash -e

# Turn off splitting at spaces: necessary for the loop below.
set -f
IFS='
'

# # Do a Jinja render of configuration files.
# j2 config.py.j2 > config.py

# PARAMETERS=$(aws ssm get-parameters-by-path --path ${SSM_PARAMETERS_PATH} --with-decryption)

# for row in $(echo ${PARAMETERS} | jq -c '.Parameters' | jq -c '.[]'); do
#     KEY=$(basename $(echo ${row} | jq -c '.Name'))
#     VALUE=$(echo ${row} | jq -c '.Value')

#     KEY=$(echo ${KEY} | tr -d '"')
#     VALUE=$(echo ${VALUE} | tr -d '"')

#     export ${KEY}="${VALUE}"
# done


# Restore splitting behaviour to default.
unset IFS
set +f

# Entrypoint for the container.
exec bash "$@"

