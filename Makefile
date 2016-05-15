MIX_EDIB_VER    = 0.7.0
MIX_EDIB_URL    = https://git.io/edib-$(MIX_EDIB_VER).ez
MIX_EDIB_CMD    = mix edib
EDIB_TOOL_VER   = 1.3.0
EDIB_TOOL       = edib/edib-tool:$(EDIB_TOOL_VER)
D_PREFIX        = ci-build
D_IMG_NAME      = edib_app_test_ci
D_IMG_FNAME     = $(D_PREFIX)/$(D_IMG_NAME)
BUILD_CMD       = $(MIX_EDIB_CMD) --prefix $(D_PREFIX) --strip
ECHO_CMD        = /bin/echo "Hello from container."
RUN_CMD         = /app/bin/$(D_IMG_NAME) command Elixir.EdibAppTestCi run

all:
	@echo Nope, you must specify a target. (setup, info, run, check)

setup:
	mkdir -p $HOME/tmp && \
	cd $HOME/tmp && \
		wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
		sudo dpkg -i erlang-solutions_1.0_all.deb  && \
		sudo apt-get update -qq && sudo apt-get install -y elixir && \
		mix local.hex --force && mix local.rebar --force && \
		mix archive.install --force $(MIX_EDIB_URL)
	mix local
	docker pull $(EDIB_TOOL)

info:
	@docker version
	@echo
	@echo Project files:
	@find $(shell pwd) -type f -not -path '*/\.git*'

run:
	$(BUILD_CMD)

run-circleci:
	$(BUILD_CMD) --no-rm

check:
	@docker images
	@(docker run --rm $(D_IMG_FNAME) $(ECHO_CMD)) || true
	@(docker run --rm $(D_IMG_FNAME) $(RUN_CMD)) || true
