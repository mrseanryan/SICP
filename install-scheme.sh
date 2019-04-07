#!/usr/bin/env bash
sudo apt-get install mit-scheme

# rlwrap (readline wrap) makes Scheme REPL more usable
sudo apt-get install rlwrap

# Racket is possibly the most complete implementation of Scheme,
# and has its own IDE (DrRacket)
sudo apt-get install racket

# Add SICP support to Racket
raco pkg install sicp

# Add unit test shorthand
raco pkg install rackunit-chk
