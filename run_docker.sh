touch ~/gns3log

docker run --name=gns3 -d -v ~/gns3log:/var/log/gns3server -p 3080:3080 gns3server:test
