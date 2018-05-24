# == Class: condition
#
# Full description of class condition here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { condition:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2018 Your name here, unless otherwise noted.
#
class condition {
case $::fqdn {

'servera.lab.example.com','serverb.lab.example.com' : {
group{'sysadmin':
	ensure	=> 'present',
	system	=> true,
}
user{'alice':
	ensure	=>	'present',
	home	=>	'/home/alice',
	shell	=>	'/bin/bash',
	groups	=>	'sysadmin',
	require	=>	Group['sysadmin'],
}
user{'bob':
        ensure  =>      'present',
        home    =>      '/home/bob',
        shell   =>      '/bin/bash',
        groups  =>      'sysadmin',
        require =>      Group['sysadmin'],
}
file{'/var/tmp/test':
	ensure	=>	'directory',
	owner	=>	'root',
	group	=>	'sysadmin',
	mode	=>	'2770',
	require	=>	Group['sysadmin'],
}
file{'/var/tmp/test/file.txt':
	ensure	=>	'file',
	owner	=>	'root',
	mode	=>	'0644',
	content	=>	template('condition/file.txt.erb'),
	require	=>	File['/var/tmp/test'],
}
}
'workstation.lab.example.com': {
package{'screen':
	ensure	=>	'present',
}
file{'/etc/motd':
	ensure	=>	'file',
	source	=>	'puppet:///modules/condition/motd.txt',
}
}
}
}

