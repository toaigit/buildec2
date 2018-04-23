#!/bin/bash
echo "Start System Admin Userdata ..."
/bin/timedatectl set-timezone America/Los_Angeles
/bin/domainname "${local_domain_name}"
/bin/hostname "${host_name}"
echo PS1=\"[\\\\u@${host_name}]\" >> /etc/bashrc
echo "Calling SysAdmin UserData from S3 ..."
#
mount  -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2 "${nfs_share_volume}" /share
/bin/echo "ebs /apps appadmin ${apps_vol}" | tee /tmp/mount_files.txt
/bin/echo "efs /unanet appadmin ${unanet_vol}" | tee -a /tmp/mount_files.txt
/bin/echo "${my_eip_id}" | tee /tmp/eip.txt
${rundir}/${host_name}/runcmd | tee /tmp/runcmd_${host_name}.log
