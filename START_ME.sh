#!/bin/bash
. start_settings.sh
. create_user.sh
. clone_repo.sh "$(0<rep_address.txt)"
. make_service.sh

