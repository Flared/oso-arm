.PHONY: build
build:
	docker build -t flared.io/oso-arm .


.PHONY: run
run: build
	rm -rf build
	mkdir build
	# https://github.com/osohq/oso.git
	docker run \
		-it \
		-v $$(pwd)/build:/opt/build \
		flared.io/oso-arm \
		bash -c '\
			mkdir -p /tmp/build \
			&& cd /tmp/build \
			&& git clone https://github.com/osohq/oso.git \
			&& cd oso \
			&& git checkout v0.27.0 \
			&& make python-build \
			&& make -C languages/python/oso package \
			&& cp -r languages/python/oso/dist/ /opt/build/ \
		'

.PHONY: venv
venv:
	python3 -m venv venv
	venv/bin/pip install twine

.PHONY: clean
clean:
	rm -rf venv build
