#!/bin/bash
echo $(sensors 2>/dev/null | grep -m 1 Core | awk '{print substr($3, 2, length($3)-5)}')
