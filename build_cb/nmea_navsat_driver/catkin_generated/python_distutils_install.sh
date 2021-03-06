#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/rip-acer-vn7-591g-1/catkin_ws/src/nmea_navsat_driver"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/rip-acer-vn7-591g-1/catkin_ws/install_cb/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/rip-acer-vn7-591g-1/catkin_ws/install_cb/lib/python2.7/dist-packages:/home/rip-acer-vn7-591g-1/catkin_ws/build_cb/nmea_navsat_driver/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/rip-acer-vn7-591g-1/catkin_ws/build_cb/nmea_navsat_driver" \
    "/usr/bin/python" \
    "/home/rip-acer-vn7-591g-1/catkin_ws/src/nmea_navsat_driver/setup.py" \
    build --build-base "/home/rip-acer-vn7-591g-1/catkin_ws/build_cb/nmea_navsat_driver" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/rip-acer-vn7-591g-1/catkin_ws/install_cb" --install-scripts="/home/rip-acer-vn7-591g-1/catkin_ws/install_cb/bin"
