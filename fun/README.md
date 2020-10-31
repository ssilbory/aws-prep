This creates a fargate cluster, loads a config with our html, and installs an nginx pod with a loadbalancer service.

Just run ./cluster.sh to create and update the cluster, html, and deployment.

Requirements:
- AWS keys
- AWS cli setup
- eksctl

Notes:
- This uses the offical docker nginx package not Ubuntu.  In order to use Ubuntu we need to build a custom docker container or find a trustworthy Ubuntu image with nginx.
- Deleting the cluster "eksctl delete cluster -f fargate.yaml"
- The fargate cluster has a single standard ec2 as you need that for various cluster pods like DNS.
