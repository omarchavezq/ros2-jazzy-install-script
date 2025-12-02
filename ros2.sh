#!/bin/bash

# --- 1. Configuración de la codificación local (Locale) ---
echo "⚙️ Configurando la codificación local..."
sudo apt update
sudo apt install locales -y
sudo locale-gen en_US en_US.UTF-8
sudo update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
export LANG=en_US.UTF-8
echo "✅ Codificación local configurada."
echo ""

# --- 2. Habilitar repositorios universales (Universe) ---
echo "📦 Habilitando el repositorio 'Universe'..."
sudo apt install software-properties-common -y
sudo add-apt-repository universe -y
echo "✅ Repositorio 'Universe' habilitado."
echo ""

# --- 3. Agregar el repositorio de ROS 2 GPG Key ---
echo "🔑 Agregando la clave GPG de ROS 2..."
sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg
echo "✅ Clave GPG agregada."
echo ""

# --- 4. Agregar el repositorio de ROS 2 a las fuentes de APT ---
echo "💿 Agregando el repositorio de ROS 2 a las fuentes de APT..."
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
echo "✅ Repositorio de ROS 2 agregado."
echo ""

# --- 5. Instalación de ROS 2 Jazzy Desktop ---
echo "🚀 Instalando ROS 2 Jazzy Desktop (incluye ROS, RViz, demos, y herramientas de desarrollo)..."
sudo apt update
sudo apt install ros-jazzy-desktop -y
echo "✅ Instalación de ROS 2 Jazzy completada."
echo ""

# --- 6. Obtener dependencias de desarrollo (Opcional, pero recomendado) ---
echo "🛠️ Obteniendo dependencias de desarrollo (colcon, etc.)..."
sudo apt install ros-dev-tools -y
echo "✅ Herramientas de desarrollo instaladas."
echo ""

# --- 7. Configuración del entorno (Setup) ---
echo "⚙️ Configurando el entorno ROS 2 para la sesión actual. Ejecuta esto manualmente para sesiones futuras:"
echo 'source /opt/ros/jazzy/setup.bash' >> ~/.bashrc
source /opt/ros/jazzy/setup.bash
echo "✅ Entorno configurado para la sesión actual y añadido a ~/.bashrc."
echo ""

# --- 8. Prueba de la instalación ---
echo "✨ Prueba de instalación: Ejecutando el talker/listener de ROS 2..."
echo "Inicia una nueva terminal y ejecuta: ros2 run demo_nodes_cpp listener"
echo "En esta terminal verás el 'talker' enviando mensajes:"
ros2 run demo_nodes_cpp talker

echo "=========================================="
echo "✅ ¡Instalación de ROS 2 Jazzy finalizada!"
echo "Reinicia tu terminal o ejecuta 'source ~/.bashrc' para asegurarte de que el entorno esté activo."
echo "=========================================="