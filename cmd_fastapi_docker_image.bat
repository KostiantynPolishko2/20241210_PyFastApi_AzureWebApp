docker build --tag fastapi-demo:v1.0.0 .

docker run --detach --publish 3100:3100 --name fastapi-webapp_v1 fastapi-demo:v1.0.0