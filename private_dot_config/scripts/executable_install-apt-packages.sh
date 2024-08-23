#!/bin/bash
sudo apt-get update
xargs -a ~/.package-list sudo apt-get install -y
