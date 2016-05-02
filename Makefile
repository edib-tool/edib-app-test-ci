all:
	@echo Nope, you must specify a target.

setup:
	mkdir -p $HOME/tmp && \
	cd $HOME/tmp && \
		wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && \
		sudo dpkg -i erlang-solutions_1.0_all.deb  && \
		sudo apt-get update -qq && sudo apt-get install -y elixir && \
		mix local.hex --force && mix local.rebar --force && \
		git clone https://github.com/edib-tool/mix-edib.git && \
		cd mix-edib && mix deps.get && mix compile && mix archive.build && \
		mix archive.install
	mix local
	docker pull edib/edib-tool:1.2.1

info:
	@docker version
	@echo
	@echo Project files:
	@find $(shell pwd) -type f -not -path '*/\.git*'

run:
	mix edib --prefix ci-build

check:
	@(docker run --rm ci-build/edib_app_test_ci /bin/echo "Hello from container.") || true
	@(docker run --rm ci-build/edib_app_test_ci /app/bin/edib_app_test_ci ping) || true
	@echo "If the message says something like ..."
	@echo "  \"Node <node@ip> not responding to pings.\""
	@echo "then this is indeed very good, because the container and Erlang were started correctly!"
