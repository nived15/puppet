class ftpserver::file{
file{"/etc/vsftpd/vsftpd.conf":
	ensure	=>	'file',
	source	=>	'puppet:///modules/ftpserver/vsftpd.conf',
	require	=>	Package['vsftpd'],
}
file{"/etc/vsftpd/custom-banner":
	ensure  =>      'file',
        source  =>      'puppet:///modules/ftpserver/custom-banner',
        require =>      Package['vsftpd'],
	notify	=>	Service['vsftpd'],
}
}
