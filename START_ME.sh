#!/bin/bash
. show_versions.sh
. start_settings.sh
. create_user.sh
exec ./clone_repo.sh 0<rep_address.txt
