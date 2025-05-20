#!/usr/bin/env bash
set -xe

echo "pinentry-program $(which pinentry-curses)" > ~/.gnupg/gpg-agent.conf
gpgconf --kill gpg-agent
