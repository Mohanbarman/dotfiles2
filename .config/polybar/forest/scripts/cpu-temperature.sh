#!/bin/bash
echo $(sensors | grep -m 1 Core | awk '{print substr($3, 2, length($3)-5)}')
