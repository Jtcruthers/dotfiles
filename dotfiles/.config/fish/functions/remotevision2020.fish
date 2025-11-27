function remotevision2020 --description 'SSH into Vision2020 EC2 host'
  ssh -i $HOME/vv/vision2020-rds.pem ec2-user@jump.vision2020.virtualvision.cloud
end
