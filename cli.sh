#!/bin/bash

# example ./cli.sh fluentd --version
nerdctl exec -it fluentd-tool "$@"
