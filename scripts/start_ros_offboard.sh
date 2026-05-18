#!/bin/bash

source ~/curso_px4/ros2_ws/install/setup.bash

echo "🤖 Iniciando Offboard ROS2..."

ros2 launch px4_offboard offboard_velocity_control.launch.py
