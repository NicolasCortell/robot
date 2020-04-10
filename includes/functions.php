<?php



function my_exec($cmd) {
	
	$desc = [
	  1 => ['pipe', 'w'], // STDOUT
	  2 => ['pipe', 'w'], // STDERR
	];

	$return = [
		'STDOUT' => '',
		'STDERR' => '',
	];
	
	$proc = proc_open($cmd, $desc, $pipes);
	if (is_resource($proc)) {

	  if ($out = stream_get_contents($pipes[1])) {
		$return['STDOUT'] = $out;
	  }
	  fclose($pipes[1]);

	  if ($err = stream_get_contents($pipes[2])) {
		$return['STDERR'] = $err;
	  }
	  fclose($pipes[2]);

	  // You can also check the process exit status
	  // 0 means success, otherwise error.
	  $exit_status = proc_close($proc);
	  
	  return $return;
	}
	
	return false;
}


$templates->registerFunction('versionized', function ($file) {
    return $file . "?ver=" . @md5(file_get_contents($file)); // avoid any error if file not exists
});