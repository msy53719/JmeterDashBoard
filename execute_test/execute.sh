#!/bin/bash
sh ./apache-jmeter-4.0/bin/jmeter.sh -n -t ./Testscript/*.jmx -l ./logs/log.jtl  -e -o ./DashBoardReport