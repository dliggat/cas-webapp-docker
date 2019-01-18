# README

## Local Build / Run

```bash
docker build -t applications/dev/ecr/cas:5.3.2 .
docker run -i -p 8080:8080 --name=cas  applications/dev/ecr/cas:5.3.2
```

## Push to ECR

```bash
$(aws ecr get-login --no-include-email --region $(aws configure get region))
docker tag applications/dev/ecr/cas:5.3.2 $(aws sts get-caller-identity --output text --query 'Account').dkr.ecr.$(aws configure get region).amazonaws.com/applications/dev/ecr/cas:5.3.2
docker push $(aws sts get-caller-identity --output text --query 'Account').dkr.ecr.$(aws configure get region).amazonaws.com/applications/dev/ecr/cas:5.3.2
```

