# Documentation:
# https://docs.docker.com/engine/reference/commandline/run/#options

touch ~/gns3log1
touch ~/gns3log2

docker run --name=gns3_1 -d -v ~/gns3log1:/var/log/gns3server -p 3080:3080 gns3server:test
docker run --name=gns3_2 -d -v ~/gns3log2:/var/log/gns3server -p 3081:3080 gns3server:test
