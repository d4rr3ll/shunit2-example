#
# Example script that will be sourced by the external test script 
#
# This script should just run as normal, but when called by the test script all
# the calls to things like java, and hadoop will be mocked out.
#
#

java testsomething.jar
if [ $? -gt 0 ]
then
	echo "java failed"
	exit 2
fi

hadoop fs -mkdir /tmp/test