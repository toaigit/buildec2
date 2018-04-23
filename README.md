Create an EC2 instance with the following characteristics:   
   you alread has an IMAGE with everything (os plus your application code).  
   you want to create an ec2 with additional filesystems
   autoscale 1.1 and EIP   
   create ebs and efs filesystem   
   mount these filesystems    
   use the userdata as a template   
   
There are two parts of the userdata.
1.  userdata as a template in terraform
2.  the userdata in the template calls another script on the server   
    to mount the filesystems.  
