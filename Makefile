shell:
	pipenv shell

# install runtime dependencies, one at a time to avoid dependencies issues
install:
	pipenv shell && pipenv install

zip-lambdas:
	rm -f terraform/iex_api_last.zip \
	&& make install-dependencies \
	&& cd lambda \
	&& zip -r iex_api_last.zip ./* \
	&& cd .. \
	&& cp lambda/iex_api_last.zip terraform/iex_api_last.zip \
	&& rm -f lambda/iex_api_last.zip
	#zip -r -j terraform/iex_api_last.zip lambda/iex_api_last.py

tf-apply:
	make zip-lambdas \
	&& cd terraform \
	&& terraform apply

tf-destroy:
	cd terraform \
	&& terraform destroy

deploy-app:
	#make zip-lambdas \
	##&& 
	make tf-destroy \
	&& make tf-apply

install-dependencies:
	rm -f requirements.txt \
	&& pipenv lock -r > requirements.txt \
	&& pip install -r requirements.txt --upgrade --no-deps -t lambda
