.PHONY: build
build:
	docker build -t flared.io/oso-arm .


.PHONY: run
run: build
	rm -rf build
	mkdir build
	# https://github.com/osohq/oso.git
	docker run \
		-v $$(pwd)/build:/opt/build \
		-it \
		flared.io/oso-arm \
		bash -c '\
			cd /opt/build \
			&& git clone https://github.com/osohq/oso.git \
			&& cd oso \
			&& git checkout v0.27.0 \
			&& make python-build \
			&& make -C languages/python/oso package \
		'

.PHONY: venv
venv:
	python3 -m venv venv
	venv/bin/pip install twine

.PHONY: clean
clean:
	rm -rf venv build
