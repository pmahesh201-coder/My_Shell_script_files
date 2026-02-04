#To setup tomcat server in ubntu linux

# Update package list
sudo apt update

# Install Java 21 (OpenJDK)
sudo apt install openjdk-21-jdk -y

# Verify installation
java -version

# Download Tomcat 9.0.113
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.113/bin/apache-tomcat-9.0.113.tar.gz

# Extract Tomcat
tar -zxvf apache-tomcat-9.0.113.tar.gz

# Add roles and user to tomcat-users.xml
sed -i '56  a\<role rolename="manager-gui"/>' apache-tomcat-9.0.113/conf/tomcat-users.xml
sed -i '57  a\<role rolename="manager-script"/>' apache-tomcat-9.0.113/conf/tomcat-users.xml
sed -i '58  a\<user username="tomcat" password="admin@123" roles="manager-gui, manager-script"/>' apache-tomcat-9.0.113/conf/tomcat-users.xml
sed -i '59  a\</tomcat-users>' apache-tomcat-9.0.113/conf/tomcat-users.xml
sed -i '56d' apache-tomcat-9.0.113/conf/tomcat-users.xml

# Remove restrictions in context.xml (so you can access Manager app remotely)
sed -i '21d' apache-tomcat-9.0.113/webapps/manager/META-INF/context.xml
sed -i '22d' apache-tomcat-9.0.113/webapps/manager/META-INF/context.xml

# Start Tomcat
sh apache-tomcat-9.0.113/bin/startup.sh


--------------------------------------------------------------------------------------------------------------------------------------

sudo apt update
sudo apt install openjdk-21-jdk -y
wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.113/bin/apache-tomcat-9.0.113.tar.gz
tar -zxvf apache-tomcat-9.0.113.tar.gz
sed -i '56  a\<role rolename="manager-gui"/>' apache-tomcat-9.0.113/conf/tomcat-users.xml
sed -i '57  a\<role rolename="manager-script"/>' apache-tomcat-9.0.113/conf/tomcat-users.xml
sed -i '58  a\<user username="tomcat" password="admin@123" roles="manager-gui, manager-script"/>' apache-tomcat-9.0.113/conf/tomcat-users.xml
sed -i '59  a\</tomcat-users>' apache-tomcat-9.0.113/conf/tomcat-users.xml
sed -i '56d' apache-tomcat-9.0.113/conf/tomcat-users.xml
sed -i '21d' apache-tomcat-9.0.113/webapps/manager/META-INF/context.xml
sed -i '22d' apache-tomcat-9.0.113/webapps/manager/META-INF/context.xml
sh apache-tomcat-9.0.113/bin/startup.sh
