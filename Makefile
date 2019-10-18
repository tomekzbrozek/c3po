shell:
	pipenv shell

# install runtime dependencies, one at a time to avoid dependencies issues
install:
	pipenv shell && pipenv install

zip-lambdas:
	rm -f terraform/iex_api_last.zip \
	&& zip -r -j terraform/iex_api_last.zip lambda/iex_api_last.py

tf-apply:
	make zip-lambdas \
	&& cd terraform \
	&& terraform apply

tf-destroy:
	cd terraform \
	&& terraform destroy

deploy-app:
	make zip-lambdas \
	&& make tf-destroy \
	&& make tf-apply
