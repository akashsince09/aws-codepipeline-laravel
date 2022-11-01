#!/bin/bash
isExistHttps = `pgrep httpd`
if [[ -n  $isExistHttps ]]; then
    sudo service httpd stop
fi
