echo "*******************Installing nginx webserver**************************************"
yum install nginx -y
echo "********************Copying the nginx configuration file****************************"
cp nginx-roboshop.conf /etc/nginx/default.d/roboshop.conf
echo "*********************Remove the default content that web server is serving**************"
rm -rf /usr/share/nginx/html/*
echo "***********************Download the frontend content************************************"
curl -o /tmp/frontend.zip https://roboshop-artifacts.s3.amazonaws.com/frontend.zip
echo "***********************Extract the frontend content***************************************"
cd /usr/share/nginx/html
unzip /tmp/frontend.zip
echo "*******************enabling nginx system service******************************************"
systemctl enable nginx
echo "********************re-starting system services****************************************"
systemctl restart nginx



