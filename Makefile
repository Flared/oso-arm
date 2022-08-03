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
			cd /build \
			&& git clone https://github.com/osohq/oso.git \
			&& cd oso \
			&& make python-build \
		'
