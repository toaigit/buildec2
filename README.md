Create an EC2 instance with the following characteristics:   
   you alread have an IMAGE with everything (os plus your code in the image).  
   you want to create an ec2 with additional filesystems
   autoscale 1.1 and EIP   
   create ebs and efs filesystem   
   mount these filesystems    
   use the userdata as a template   
   
There are two parts of the userdata.
1.  userdata as a template in terraform (userdata.sh)   
2.  the folder ec2userdata is your userdate on the ec2   
    the main script is runcmd   
