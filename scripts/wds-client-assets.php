<?php

if ( ! isset( $argv[1] ) ) {
	echo "wds-client-assets.php update /Users/foo/bar";
	return;
}

$file = isset( $argv[2] ) && 'php0' != $argv[2] ? $argv[2] : "/Users/aubreypwd/wds-client-assets";

switch( $argv[1] ) {
	case "update":
		exec( "(cd $file && git pull origin master)" );
	break;
}
