package Models::User;

use strict;
use warnings;
use Data::Dumper;




sub is_autorized
{
	my $self = $_[0];
	return 1;
}

sub addUser
{
    
}


sub checkForm($)
{
    my $self = shift;
    my $data = shift;
    print Dumper($data);
    print Dumper($self->{'validator'});
    if ($self->{'validator'}->valName($data->{'name'}) && $self->{'validator'}->valEmail($data->{'email'}) && $self->{'validator'}->valPass($data->{'password'}))
    {
        return 1;
    }
    return 0;
}

sub new
{
    my $class = ref($_[0])||$_[0];
	
    return bless {'Db'=> $_[1],'validator'=> $_[2]}; $class;
}
1;
