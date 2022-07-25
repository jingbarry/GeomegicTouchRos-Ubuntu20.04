# 项目介绍

该项目用于将Geomegic_Touch力反馈设备在ROS下的运行，适用于Ubuntu20。主要包含两部分，分别为：
1. Touch的Linux驱动安装：包括OpenHaptics_v3.4和Touch_Device_Drive_v2022
2. Touch的ROS代码编译

# 背景介绍

网上有很多介绍[如何安装Touch_ROS的帖子](https://blog.csdn.net/weixin_41969030/article/details/122004571)，
但是大多都是基于[bharatm11的项目](https://github.com/bharatm11/Geomagic_Touch_ROS_Drivers)。

由于该项目创建于8年前，不适用于Ubuntu较高版本，尤其是在18.04和20.04中，编译总是会或多或少出现各种错误。

此外，随着版本迭代，Touch的Linux库也更新到了2022版，驱动的安装方法也发生了变化。

在走了无数弯路后，最终得到一个完美不出错的适用于Ubuntu20.04的Touch_ROS的安装方法，在这里分享给大家

# Touch的Linux驱动安装

这部分基于[jhu-cisst-external的自动化安装脚本](https://github.com/jhu-cisst-external/3ds-touch-openhaptics)进行了修改，将其中的Touch_Device_Drive从v2019更新到了v2022，并提供了两个驱动安装包而无需从官网下载

## 使用方法

下载本库内容，然后执行
```
sudo ./install-3ds-touch-drivers-2022.sh
sudo ./install-3ds-openhaptics-3.4.sh
reboot
```

# Touch的ROS代码编译

本库不提供代码，直接使用[WPI-AIM的Touch_ROS代码](https://github.com/WPI-AIM/ros_geomagic)

## 使用方法

```
mkdir -p ~/touch_ws/src
cd ~/touch_ws/src
catkin_init_workspace
git clone https://github.com/WPI-AIM/ros_geomagic
cd ..
catkin_make
source dev/setup.bash
roslaunch geomagic_control geomagic_headless.launch
```
打开新窗口查看话题
```
rostopic echo /Geomagic/pose
```
如果想运行仿真，执行
```
roslaunch geomagic_control geomagic.launch
```
注意，每次新开一个窗口，都要执行
```
source dev/setup.bash
```
