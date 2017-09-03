package Controllers::Home;

use strict;
use warnings;
use Data::Dumper;
use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
use CGI::Carp qw(fatalsToBrowser);

use vars qw(%in);
$|=1;
ReadParse();


sub run
{

	my ($self) = shift; 
# print "Content-type: text/html; charset=utf-8\n\n";
# print '<pre>'.Dumper(%in->{'action'}).'</pre>';

	
	my $action = %in->{'action'};

	my %buttons;
	if($self->{'UModel'}->is_autorized())
	{
		if ($action eq 'logout')
		{
			$self->{'UModel'}->logOut();
		}
		%buttons->{'BUTT_showCabinetButton'} = $self->{'View'}->makeButton({'LANG_destination'=>'index.cgi?page=cabinet',
																				  'LANG_text' => 'Cabinet'});
		%buttons->{'BUTT_showLogOutButton'} = $self->{'View'}->makeButton({'LANG_destination'=>'index.cgi?action=logout',
																				 'LANG_text' => 'Log Out'});
	}
	else
	{
		%buttons->{'BUTT_showLoginButton'} = $self->{'View'}->makeButton({'LANG_destination'=>'index.cgi?page=login',
																				'LANG_text' => 'Login'});
		%buttons->{'BUTT_showRegButton'} = $self->{'View'}->makeButton({'LANG_destination'=>'index.cgi?page=register',
																			  'LANG_text' => 'Registration'});
	}
	my $data = $self->{'AModel'}->getArticles();
	my $templateName = 'templates/home/home.html';
	$self->{'View'}->read($templateName);
	$self->{'View'}->parseButtons(\%buttons);
	my @data = @$data;
	$self->{'View'}->parsePage(@data);
	
}


sub new
{
    my $class = ref($_[0])||$_[0];
    return bless {'UModel' => $_[1],'AModel' => $_[2],'View'=> $_[3]}; $class;
}
1;
