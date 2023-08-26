#!/usr/bin/env bash

jq '[.data|.[]|.[0,1]]' task4_input.json
