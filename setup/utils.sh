#!/bin/bash

cmd_exists() {
  command -v "$1" &> /dev/null
}

print_info() {
  echo "[INFO] $1"
}

print_error() {
  echo "[ERROR] $1"
}
