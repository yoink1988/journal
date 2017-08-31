package Utils::Router;

use strict;
use warnings;
use Data::Dumper;
use vars qw(%in);



sub selectPage
{
	my ($self) = shift;
# 	print Dumper( %ENV->{'REQUEST_METHOD'});   
#    print '<pre>'.Dumper($self->{'request'}).'</pre>';
    
#	print '<pre>'.Dumper($self->{'request'}).'</pre>';
	my $page;
	if(!$self->{'request'}) 
		{
			$page = 'home';
		}
		if($self->{'request'} eq 'page=register')
		{
			$page = 'Register';
		}
	return $page;
}

sub new
{
    my $class = ref($_[0])||$_[0];
	
    return bless {'request' => $_[1]}; $class;
}
1;
