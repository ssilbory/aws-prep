Lab objective:
- Create a Ubuntu server running nginx with static home page with a custom greeting in EC2 behind a LB.
- This should be done with a single command and you should be able to run the command repeatably.

Thoughts:
- You could do it with boto3 or the aws cli, but that seems like a lot of effort for poor return.
- The text book correct way is to use terraform or cloudformation to create the resources in a proper IaC.
  - I'm not familiar with CF so terraform is the logical choice.
  - Terraform is mentioned so it's the obvious correct choice.
- Honestly this seems like I could take an example terraform, change the ami, change the payload, and call it a day.
- It would be more interesting and job relevant to do this eks in fargate
- Honestly it would be cheaper, and better in every way to just use S3 for the static page, but obviously this is a stand in for a more complex payload.


Implementations:

Boring Terraform:
- create vpc
- create public and private subnets
- create EC2 ASG of Ubuntu with userdata installing nginx, and html. (Scale via CPU?)
- create Load Balancer


Fun, but non conforming:
- build docker file with ubuntu nginx and html
- upload docker image
- create eks fargate cluster
- create deployment with docker and hpa
