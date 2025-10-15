function remotedev --description 'SSH into dev EC2 host'
  #function remotedev --wraps='ssh -i /Users/Justin/vv/devrds.pem ec2-user@ec2-3-220-167-27.compute-1.amazonaws.com' --description 'SSH into dev EC2 host'
  ssh -i /Users/Justin/vv/devrds.pem ec2-user@ec2-44-198-54-5.compute-1.amazonaws.com 
end
