class webtest::service {
service{"httpd":
	ensure	=> 'running',
	enable	=>	true,
	require	=>	Package['httpd'],
}
}
