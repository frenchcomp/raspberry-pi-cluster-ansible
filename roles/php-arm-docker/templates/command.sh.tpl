#!/bin/bash

cd {{ php_arm_service.volume_path_container }}

if [-x boot.sh]; then
    ./boot.sh
fi
