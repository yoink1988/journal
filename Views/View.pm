package Views::View;

use strict;
use warnings;
use Data::Dumper;


#sdelat proverku na file_exists and is_readable
sub read($)
{
    
	my ($self) = shift;
	my $fileName = $_[0];
	$self->{'html'} = $self->{'fh'}->readFile($fileName);
}


sub parse($)
{
    my($self, $hash) = @_;
    $self->{'html'} =~ s/LANG_(\w)+/$hash->{$&}/gse;
}


sub getHtml
{
	my ($self) = shift;
	return $self->{'html'};
	
}

sub new
{
    my $class = ref($_[0])||$_[0];
    return bless {'fh' => $_[1], 'html' => ''}; $class;
}
1;
