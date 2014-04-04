###############################################################################
#
# Mocked out functions
#
hadoop()
{
	echo "mocked out hadoop [$@]"

	ACTION=$1
	shift
	
	case $ACTION in
		fs)
			echo "fs command"
		;;
		*)
			echo "unknown command"
		;;
	esac

	return 0
}

java()
{
	echo "mocked out java [$@]"

	[ ! -z $MOCKEDJAVAEXITCODE ] && return $MOCKEDJAVAEXITCODE

	return 0
}


###############################################################################

_runTests()
{
	local TESTSCRIPT MAINSCRIPT
	TESTSCRIPT=$(basename $0)
	MAINSCRIPT="$(dirname $0)/../$(echo $TESTSCRIPT | cut -d . -f 1 ).sh"

	echo $MAINSCRIPT

	(
		source $MAINSCRIPT
	)

	return $?
}



###############################################################################


testMain()
{

	_runTests

}


testMainFailJava()
{

	MOCKEDJAVAEXITCODE=1

	_runTests

	EXITCODE=$?

	assertEquals "Exitcode" 2 $EXITCODE 
}

###############################################################################

source $(dirname $0)/../../../test/shunit2/src/shunit2