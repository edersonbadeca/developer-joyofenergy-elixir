FROM elixir:otp-26

COPY . /app
WORKDIR /app

RUN mix local.hex --force && mix local.rebar --force && \
	mix deps.get && \
	mix compile && \
	mix phx.digest
EXPOSE 4000
CMD ["mix", "phx.server"]
