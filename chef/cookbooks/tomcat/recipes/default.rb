#
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

PROJ_ROOT_DIR="/d01"
TOMCAT_STARTUP_SCRIPT="#{PROJ_ROOT_DIR}/tomcat/bin/startup.sh"
TOMCAT_SHUTDOWN_SCRIPT="#{PROJ_ROOT_DIR}/tomcat/bin/shutdown.sh"
TOMCAT_TAR_FILE_NAME="apache-tomcat-9.0.0.M19.tar.gz"
TOMCAT_DIR="#{TOMCAT_TAR_FILE_NAME}"
TOMCAT_DIR.slice! ".tar.gz"
PROJ_TOMCAT_DIR="#{PROJ_ROOT_DIR}/#{TOMCAT_DIR}"
TOMCAT_TAR_DIR="/opt"
TOMCAT_TAR_LOC="#{TOMCAT_TAR_DIR}/#{TOMCAT_TAR_FILE_NAME}"
TOMCAT_URL="http://redrockdigimark.com/apachemirror/tomcat/tomcat-9/v9.0.0.M19/bin/apache-tomcat-9.0.0.M19.tar.gz"

package "java-1.8.0-openjdk"

if ! File.directory?("#{PROJ_ROOT_DIR}/tomcat")

remote_file "#{TOMCAT_TAR_LOC}" do 
	source "#{TOMCAT_URL}"
end

execute "Extracting Tomcat" do 
	command "tar -xzf #{TOMCAT_TAR_LOC}"
	cwd "#{PROJ_ROOT_DIR}"
end

execute "Rename tomcat directory" do
	command "mv #{TOMCAT_DIR} tomcat"
	cwd "#{PROJ_ROOT_DIR}"
end

end

template "/d01/tomcat/conf/context.xml" do
  source 'context.xml.erb'
end

if ! system("ps -ef |grep /#{PROJ_ROOT_DIR}/tomcat  |grep -v grep")
	system("#{TOMCAT_STARTUP_SCRIPT}")

else
	system("#{TOMCAT_SHUTDOWN_SCRIPT}")
	system("sleep 15")
	system("#{TOMCAT_STARTUP_SCRIPT}")

end














