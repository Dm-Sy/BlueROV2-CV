# Start from the official ROS 2 Humble Desktop image
FROM osrf/ros:humble-desktop

# Install CycloneDDS and clean up apt lists, add plugin on how to read and write the .mcap file format.
RUN apt-get update && apt-get install -y \
    ros-humble-rmw-cyclonedds-cpp \
    ros-humble-rmw-fastrtps-cpp \
    ros-humble-rosbag2-storage-mcap \
    ros-humble-gscam \
    gstreamer1.0-tools gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly \
    gstreamer1.0-libav \
    #---Added lines for the vision processing---
    ros-humble-cv-bridge \
    python3-opencv \
    #---Added line for image compressing---
    ros-humble-image-transport-plugins \
    #---Added line for camera calibration---
    python3-semver \
    
    ros-humble-topic-tools \
    
    && rm -rf /var/lib/apt/lists/*

# Add sourcing commands to the .bashrc file for convenience
RUN echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc 						&& \
    echo "source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.bash" >> /root/.bashrc 		&& \
    echo "source /root/ros2_ws/install/setup.bash" >> /root/.bashrc 					 
