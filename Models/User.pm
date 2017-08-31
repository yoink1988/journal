package Models::User;

use strict;
use warnings;
use Data::Dumper;




sub is_autorized
{
	my $self = $_[0];
	return 1;
}

sub new
{
    my $class = ref($_[0])||$_[0];
	
    return bless {}; $class;
}
1;