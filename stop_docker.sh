# Documentation:
# https://docs.docker.com/engine/reference/commandline/stop/

docker stop $(docker ps --filter "name=gns3" -a -q)
