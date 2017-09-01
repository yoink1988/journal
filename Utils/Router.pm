package Utils::Router;

use strict;
use warnings;

use Data::Dumper;
use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
use CGI::Carp qw(fatalsToBrowser);
use vars qw(%in);
$|=1;
ReadParse();



sub selectPage
{
	my ($self) = shift;
 #	print Dumper( %ENV->{'REQUEST_METHOD'});   
 #   print '<pre>'.Dumper(\%in).'</pre>';
    my $page = %in->{'page'};

	if($page eq undef) 
	{
		$page = 'home';
	}
	if($page eq 'register')
	{
		$page = 'Register';
	}
	if($page eq 'login')
	{
		$page = 'Login';
	}
	if($page eq 'logout')
	{
		$page = 'Logout';
	}
	if($page eq 'cabinet')
	{
		$page = 'Cabinet';
	}

	return $page;
}

sub new
{
    my $class = ref($_[0])||$_[0];
	
    return bless {}; $class;
}
1;
