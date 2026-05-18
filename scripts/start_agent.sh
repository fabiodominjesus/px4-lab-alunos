#!/bin/bash

docker exec -it px4_lab bash -c "
MicroXRCEAgent udp4 -p 8888
"
