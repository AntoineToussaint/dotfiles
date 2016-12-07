#!/bin/bash
ssh antoine@$1 mkdir -p .ssh
cat .ssh/id_rsa.pub | ssh antoine@$1 'cat >> .ssh/authorized_keys'
