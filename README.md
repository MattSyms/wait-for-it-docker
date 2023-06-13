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

## Example

Testing `google.com` availability on port `443`:

```
docker run mattsyms/wait-for-it google.com:443 -- echo Google is up!
```
