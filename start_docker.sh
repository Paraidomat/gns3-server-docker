# Documentation:
# https://docs.docker.com/engine/reference/commandline/start/#options

docker start $(docker container list -a -q --filter "name=gns3_1")
docker start $(docker container list -a -q --filter "name=gns3_2")
