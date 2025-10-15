function remoteappnew --description 'SSH into app-new EC2 host'
  ssh -i $HOME/vv/app-new.pem ec2-user@ec2-13-221-213-159.compute-1.amazonaws.com
end
