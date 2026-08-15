sudo apt update -y && sudo apt upgrade -y

sudo apt install python3-pip -y

# cd /root/ros2_ws
rosdep install --from-path src --ignore-src -y

source /opt/ros/humble/setup.bash && source /root/ros2_ws/install/setup.bash 

# export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
ros2 daemon stop
# export FASTRTPS_DEFAULT_PROFILES_FILE... todo
unset RMW_IMPLEMENTATION
ros2 daemon stop

export RMW_IMPLEMENTATION=rmw_fastrtps_cpp
export FASTRTPS_DEFAULT_PROFILES_FILE=/root/fastdds_profiles.xml

colcon build --packages-skip opencv_cam
