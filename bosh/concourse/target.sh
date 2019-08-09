#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

fly login -t lab -c https://concourse.lab.paasify.org -u admin -p admin -n main

fly -t lab sync