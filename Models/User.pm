package Models::User;

use strict;
use warnings;
use Data::Dumper;
use Digest::MD5 qw(md5 md5_hex md5_base64); 



sub is_autorized
{
    my $self = $_[0];
    return 0;
}

sub addUser
{
    my $self = shift;
    my $data = shift;
    my $name = $data->{'name'};
    my $email = $data->{'email'};
    my $pass = md5_hex($data->{'password'});
    my $query = 'INSERT INTO users (name, email, pass) VALUES (\''.$name.'\', \''.$email.'\', \''.$pass.'\')';
    if ($self->{'Db'}->insert($query) == 1)
    {
        return 1;
    }
    return 0;
}

sub isEmailExists
{
    my ($self, $email) = @_;
    my $query = 'SELECT email FROM users WHERE email=\''.$email.'\'';
    #print $query;
    my $resEmail = $self->{'Db'}->select($query);
    if ($resEmail->['email'] ne '')
    {

        return 1;
    }
    else
    {
        # email not exists
        return 0;
    }

}


sub checkRegForm($)
{
    my $self = shift;
    my $data = shift;
#    print Dumper($data);
#    print Dumper($self->{'validator'});
    if ($self->{'validator'}->valName($data->{'name'}) && $self->{'validator'}->valEmail($data->{'email'}) && $self->{'validator'}->valPass($data->{'password'}))
    {
        return 1;
    }
    return 0;
}

# sub checkLogForm($)
# {
# my $self = shift;
# my $data = shift;

# if ($self->{'validator'}->valEmail($data->{'email'}) && $self->{'validator'}->valPass($data->{'password'}))
# {
# return 1;
# }
# return 0;
# }


sub new
{
    my $class = ref($_[0])||$_[0];

    return bless {'Db'=> $_[1],'validator'=> $_[2]}; $class;
}
1;
