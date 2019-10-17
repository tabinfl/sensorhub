FROM java:8-jdk

#RUN apt-get update
#RUN apt-get install -y wget git unzip

WORKDIR /sensorhub

COPY . .

#WORKDIR /sensorhub/osh-core
#RUN ./gradlew build
WORKDIR /sensorhub/osh-addons/dist/osh-base
RUN ./gradlew build

WORKDIR /sensorhub
RUN unzip osh-addons/dist/osh-base/build/distributions/osh-base-install-1.3.3.zip

WORKDIR /sensorhub/osh-base-install-1.3.3

EXPOSE 8181

CMD ./launch.sh
#CMD sleep 36000
