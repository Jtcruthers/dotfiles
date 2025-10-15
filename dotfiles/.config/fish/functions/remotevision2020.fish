function remotevision2020 --description 'SSH into Vision2020 EC2 host'
  ssh -i $HOME/vv/vision2020-rds.pem ec2-user@ec2-54-242-129-42.compute-1.amazonaws.com
end
