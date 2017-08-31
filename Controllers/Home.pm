package Controllers::Home;

use strict;
use warnings;
use Data::Dumper;



sub run
{
	my ($self) = shift;
	
#	if($self->{'UModel'}->is_autorized())
#	{
		
#	}
	my $data = $self->{'AModel'}->getArticles();
	my @data = @$data;
	my %placeholders->{'LANG_articles'} = '';
	%placeholders->{'LANG_articles'}.='<div><ol>';
	#print '<pre>'.Dumper(@data).'</pre>';
	foreach my $value (@data)
	{
		
		 %placeholders->{'LANG_articles'}.='<li>'.$value->{'title'}.'</li>'.'<li>'.$value->{'body'}.'</li>';
	}
	
	%placeholders->{'LANG_articles'}.='</ol></div>';
	
#	print Dumper(\%placeholders);
	
	
	my $templateName = 'templates/home.html';
	
	$self->{'View'}->read($templateName);
	$self->{'View'}->parse(\%placeholders);
}


sub new
{
    my $class = ref($_[0])||$_[0];
	
    return bless {'UModel' => $_[1],'AModel' => $_[2],'View'=> $_[3]}; $class;
}
1;
