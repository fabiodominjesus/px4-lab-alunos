#!/bin/bash

docker exec -it px4_lab bash -c "
cd /workspace/PX4-Autopilot
make px4_sitl gz_x500
"
