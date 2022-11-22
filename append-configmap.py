#!/usr/bin/python3
#
# append-configmap: Indents the dashy conf.yml file so it can be concatenated to
#                   the `manifest/configmap.yml`. to use
#  `cat manifest/conf.yml | python3 append-configmap.py >> manifext/configmap.yml`
import sys
 
for line in sys.stdin:
 print("    %s" % line, end="")

