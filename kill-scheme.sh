#!/usr/bin/env bash

# note: the [] around mit is to stop this killing itself!
kill $(ps aux | grep [mit]-scheme | awk '{print $2}')
