class webtest::file {
file{"/var/www/html/index.html":
	ensure	=>	'file',
	owner	=>	'root',
	mode	=>	'0644',
	content	=>	template('webtest/index.html.erb'),
	require	=>	Package['httpd'],
}

file{"/etc/httpd/conf.d/nived.conf":
	ensure	=>	'file',
	owner	=>	'root',
	mode	=>	'0644',
	content	=>	template('webtest/nived.conf.erb'),
	require	=>	Package['httpd'],
}
}
