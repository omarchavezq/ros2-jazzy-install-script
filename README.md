# ros2-jazzy-install-script
# 🚀 Instalador Automático de ROS 2 Jazzy para Ubuntu
Un script de shell (`.sh`) para automatizar la instalación completa de ROS 2 "Jazzy Jalisco" (la versión Desktop) en sistemas Ubuntu compatibles (22.04 LTS, 24.04 LTS).

Basado en las [instrucciones oficiales de instalación Debian (Ubuntu)](https://docs.ros.org/en/jazzy/Installation/Ubuntu-Install-Debs.html).
## 📋 Requisitos

* **Sistema Operativo:** Ubuntu Jammy Jellyfish (22.04 LTS) o Noble Numbat (24.04 LTS)
* **Acceso a Internet**
* **Permisos de `sudo`**

## ⚙️ Uso

Sigue estos sencillos pasos para descargar y ejecutar el script.

1.  **Clonar el Repositorio:**
    ```bash
    git clone [https://github.com/TU_USUARIO/ros2-jazzy-install-script.git](https://github.com/TU_USUARIO/ros2-jazzy-install-script.git)
    cd ros2-jazzy-install-script
    ```

2.  **Dar Permisos de Ejecución:**
    ```bash
    chmod +x setup_ros2_jazzy.sh
    ```

3.  **Ejecutar el Script:**
    ```bash
    ./setup_ros2_jazzy.sh
    ```
    *(El script te pedirá la contraseña de `sudo` para instalar las dependencias del sistema.)*

4.  **Verificación Final:**
    Una vez terminado, reinicia tu terminal o ejecuta:
    ```bash
    source ~/.bashrc
    ```
    Y prueba la instalación con el ejemplo de los nodos demo:
    ```bash
    ros2 run demo_nodes_cpp talker
    ```

## 💡 Qué Hace el Script

El script realiza automáticamente las siguientes acciones:

1.  **Configura el Locale** (`en_US.UTF-8`).
2.  **Habilita el repositorio Universe** de Ubuntu.
3.  **Agrega la GPG key** de ROS 2.
4.  **Añade el repositorio** oficial de paquetes Debian de ROS 2.
5.  **Instala el metapaquete** `ros-jazzy-desktop`.
6.  **Instala las herramientas de desarrollo** (`ros-dev-tools`).
7.  **Configura el entorno** de ROS 2 en tu archivo `~/.bashrc`.


