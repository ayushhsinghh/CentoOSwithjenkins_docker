# CentoOSwithjenkins_docker
This is a Dockerfile of CentOS that has Jenkins and Docker Added With some Extra Packages

Packages that will be Installed Are 
1.jenkins
2.Java-11-Openjdk-src.x86_64
3.Docker 
4.Git
5.Wget
5.sudo

and Their Dependencie

# Build Image
==> Docker build -t $OSName:version $Location_of_Dockerfile

#Run Docker Container 
==> Docker run -dit --name $AnyName --Privileged $OSName:version

#Run Bash Inside The Container
==> Docker exec -it $nameofContainer bash
  Note : Use Sudo For Every Command 
