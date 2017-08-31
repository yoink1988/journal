package Utils::Router;

use strict;
use warnings;
use Data::Dumper;
use vars qw(%in);



sub selectPage
{
	my ($self) = shift;
#	print '<pre>'.Dumper($self->{'request'}).'</pre>';
	my $page;
	if(!$self->{'request'}->{'page'}) 
		{
			$page = 'home';
		}
		else
		{
			$page = $self->{'request'}->{'page'};
		}
	return $page;
}

sub new
{
    my $class = ref($_[0])||$_[0];
	
    return bless {'request' => $_[1]}; $class;
}
1;