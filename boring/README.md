# Basic nginx with load balance. 

To run, configure your AWS provider as described in 

https://www.terraform.io/docs/providers/aws/index.html

Run with a command like this:

```
terraform apply 
```

For example:

```
terraform init
terraform apply 
<examine result>
terraform destroy
```


TODO:
- Convert lb to alb and switch to https on frontend
- Shift nginx to private subnet
- Convert instance to ASG
- Switch to 2 pub, 2 private subnets on two different availblity zones
