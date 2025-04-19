set -x
#deploy_path="/opt/dataware"
deploy_path="/home/gitlab-runner/dataware"
ip a
id
if [ ! -d "$deploy_path" ]
then
   project_path="ssh://git@10.10.11.15:1022/zhanggn/dataware.git"
   git clone $project_path $deploy_path
else
   cd $deploy_path
   git pull
   date
   echo "copy file to cdh prod env"
   #scp -r /opt/dataware cdh-3:/opt/
   #scp -r /opt/dataware cdh-4:/opt/
   #scp -r /opt/dataware cdh-5:/opt/
   date
   echo "copy file to bi prod env"
   scp -r /home/gitlab-runner/dataware root@biprod01:/opt
   scp -r /home/gitlab-runner/dataware root@biprod02:/opt
   scp -r /home/gitlab-runner/dataware root@biprod03:/opt
   scp -r /home/gitlab-runner/dataware root@biprod04:/opt
   scp -r /home/gitlab-runner/dataware root@biprod05:/opt
   scp -r /home/gitlab-runner/dataware root@biprod06:/opt
   date
fi
