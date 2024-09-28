# Welcome to PowerDale

PowerDale is a small town with around 100 residents. Most houses have a smart meter installed that can save and send
information about how much power a house is drawing/using.

There are three major providers of energy in town that charge different amounts for the power they supply.

- _Dr Evil's Dark Energy
- _The Green Eco_
- _Power for Everyone_

# Introducing JOI Energy

JOI Energy is a new start-up in the energy industry. Rather than selling energy they want to differentiate themselves
from the market by recording their customers' energy usage from their smart meters and recommending the best supplier to
meet their needs.

You have been placed into their development team, whose current goal is to refactoring the legacy application to create a good base to scale the business.

Unfortunately, two members of the team are on annual leave, and another one has called in sick! You are left with another ThoughtWorker to progress with the current user stories on the story wall. This is your chance to make an impact on the business, improve the code base and deliver value.

# Story Wall

At JOI energy the development team use a story wall or Kanban board to keep track of features or "stories" as they are worked on.
The wall you will be working from today has 7 columns:

- Backlog
- Ready for Dev
- In Dev
- Ready for Testing
- In Testing
- Ready for sign off
- Done

Examples can be found
here [https://leankit.com/learn/kanban/kanban-board/](https://leankit.com/learn/kanban/kanban-board/)

## Requirements

The project requires [Elixir 1.17.3 (compiled with Erlang/OTP 26)](https://elixir-lang.org/install.html) or higher.

### Installation

After installing elixir, install the dependencies with:
```console
mix deps.get
```

### Run the tests
```console
mix test
```

### Run the application

Run the application which will be listening on port 4000

```console
mix phx.server
```
### Pre-commit hooks
The project is offering [pre-commit](https://pre-commit.com/) hooks, please install them via
```console
pre-commit install
```

### GitHub Actions
Each commit in the main branch will trigger a pipeline which will run unit tests and different linting tools.
When successful it will also containerize the application, finally its scans the docker image for vulnerabilities with [Trivy](https://aquasecurity.github.io/trivy/v0.49/). 


### Building Docker Image
The application can be containerized by using:
```console
docker build -t joy-energy .
```

### Building Docker image
Once the docker image is built, it can be run with:
```console
docker run -p 8020:8020 joy-energy
```




