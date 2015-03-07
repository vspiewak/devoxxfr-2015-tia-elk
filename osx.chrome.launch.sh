#!/bin/sh

/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \
--incognito \
'http://localhost:19200/_plugin/head' \
'http://localhost:10080/kibana/index.html#/dashboard/file/collectd.json' \
'http://localhost:10080/kibana/index.html#/dashboard/file/system.json' \
'http://localhost:10080/kibana/index.html#/dashboard/file/jmx.json' \
'http://localhost:10080/kibana/index.html#/dashboard/file/market.json' \
'http://localhost:10080/kibana/index.html#/dashboard/file/board.json' \
'http://localhost:15601' \
&> /dev/null &
