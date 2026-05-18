#!/bin/bash

set -e

echo "🚀 Iniciando PX4 Lab do aluno..."

# -----------------------------
# 1. Verifica container
# -----------------------------
echo "📦 Verificando container..."
docker start px4_lab >/dev/null 2>&1 || true

# -----------------------------
# 2. Inicia PX4 + Gazebo
# -----------------------------
echo "🛩️ Iniciando PX4 + Gazebo..."

docker exec -d px4_lab bash -c "
cd /workspace/PX4-Autopilot &&
make px4_sitl gz_x500
"

# -----------------------------
# 3. Sobe ROS2 (se existir script)
# -----------------------------
if [ -f "./scripts/start_ros.sh" ]; then
    echo "🤖 Iniciando ROS2..."
    bash ./scripts/start_ros.sh &
fi

# -----------------------------
# 4. Sobe MAVLink / Agent
# -----------------------------
if [ -f "./scripts/start_agent.sh" ]; then
    echo "📡 Iniciando MAVLink agent..."
    bash ./scripts/start_agent.sh &
fi

# -----------------------------
# 5. Mensagem final
# -----------------------------
echo "✅ LAB PRONTO!"
echo "👉 PX4 + Gazebo + ROS2 em execução"
echo "👉 Use stop.sh para encerrar"
