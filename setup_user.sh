#!/bin/bash

useradd anbu --password anbu --shell /bin/bash
mkdir -p /home/anbu/.config/nvim
chown anbu /home/anbu
chgrp anbu /home/anbu
echo "root:Docker!" | chpasswd

