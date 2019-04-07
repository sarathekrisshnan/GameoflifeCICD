# Dockerfile
FROM tomcat

ADD gameoflife-web/target/gameoflife.war /usr/local/tomcat/webapps/gameoflife.war
