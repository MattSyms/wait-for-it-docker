# Wait For It on Docker

Docker image running the [wait-for-it](https://github.com/vishnubob/wait-for-it) script.

Docker Hub repository: [mattsyms/wait-for-it](https://hub.docker.com/r/mattsyms/wait-for-it).

GitHub repository: [MattSyms/wait-for-it-docker](https://github.com/MattSyms/wait-for-it-docker).

## Usage

```
docker run mattsyms/wait-for-it host:port [options] [-- command args]
```

Options:

```
-h HOST | --host=HOST   Host or IP under test
-p PORT | --port=PORT   TCP port under test
                        Alternatively, specify host and port as host:port
-s | --strict           Only execute subcommand if the test succeeds
-q | --quiet            Don't output any status messages
-t SEC | --timeout=SEC  Timeout in seconds, zero for no timeout
-- COMMAND ARGS         Execute command with args after the test finishes
```

## Examples

### Basic example

Testing `google.com` availability on port `443`:

```
docker run mattsyms/wait-for-it -s google.com:443 -- echo Google is up!
```

### Usage with Docker Compose

Starting the `app` service after required dependencies are available:

```yml
version: '3.8'

services:
  app:
    image: alpine
    entrypoint: echo App started
    depends_on:
      mysql:
        condition: service_started
      redis:
        condition: service_started
      wait-for-it:
        condition: service_healthy

  wait-for-it:
    image: mattsyms/wait-for-it
    entrypoint: tail -f /dev/null
    healthcheck:
      test: >
        w -t 0 mysql:3306 &&
        w -t 0 redis:6379 || (exit 1)
      timeout: 60s
      interval: 1s
      retries: 1

  mysql:
    image: mysql
    environment:
      - MYSQL_RANDOM_ROOT_PASSWORD=1

  redis:
    image: redis

```

Run the app:

```
docker compose run --rm app
docker compose down -v -t0
```
