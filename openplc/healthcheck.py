import urllib
import sys

code = urllib.urlopen("http://127.0.0.1:8080").getcode()

if code == 200:
    sys.exit(0)
else:
    sys.exit(1)
