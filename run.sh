#!/bin/bash

docker container stop $(docker container ls -aq)

docker-compose up -d
docker exec -d astrobee_sim_container /bin/bash -c "source /root/freeflyer_build/native/devel/setup.bash \
&& roslaunch astrobee sim.launch dds:=false robot:=sim_pub rviz:=true"
echo "Opening browser interface..."
sleep 1
xdg-open http://localhost:8080/vnc_auto.html &