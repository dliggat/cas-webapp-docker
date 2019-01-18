.PHONY: create-stack update-stack delete-stack describe-stack _is_user_authenticated _check-params

STACK_NAME = $(PROJECT)-$(COMPONENT)-$(ENV)

_is_user_authenticated:
	@aws sts get-caller-identity > /dev/null

_check-params:
ifndef ENV
	$(error ENV is undefined; see README) )
endif
ifndef COMPONENT
	$(error COMPONENT is undefined; see README) )
endif
ifndef PROJECT
	$(error PROJECT is undefined; see README) )
endif

ifndef PROFILE
	$(error PROFILE is undefined; the profile is used to connect to the correct AWS Account, sample configuration can be seen in .README.md )
endif


create-stack: _check-params _is_user_authenticated
	aws cloudformation create-stack \
	  --profile $(PROFILE) \
	  --stack-name $(STACK_NAME) \
	  --template-body file://./components/$(COMPONENT).yaml \
	  --parameters file://./environments/$(ENV)/$(COMPONENT).json \
	  --capabilities CAPABILITY_IAM

update-stack: _check-params _is_user_authenticated
	aws cloudformation update-stack \
	  --profile $(PROFILE) \
	  --stack-name $(STACK_NAME) \
	  --template-body file://./components/$(COMPONENT).yaml \
	  --parameters file://./environments/$(ENV)/$(COMPONENT).json \
	  --capabilities CAPABILITY_IAM

delete-stack: _check-params _is_user_authenticated
	aws cloudformation delete-stack \
	  --profile $(PROFILE) \
	  --stack-name $(STACK_NAME)

describe-stack: _check-params _is_user_authenticated
	aws cloudformation describe-stacks \
	  --profile $(PROFILE) \
	  --stack-name $(STACK_NAME)
