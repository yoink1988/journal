package Controllers::Login;

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
    if($self->{'UModel'}->is_autorized())
	{
		#redirect index.cgi
	}
	
	my $req_meth = %ENV->{'REQUEST_METHOD'};
 #   print '<pre>'.Dumper(\%ENV).'</pre>';
 #   print '<pre>'.Dumper(\%in).'</pre>';

	if($req_meth eq 'GET')
	{
        $self->{'View'}->read('templates/login/login.html'); 
 	}
	if($req_meth eq 'POST')
	{
        my $postData = \%in;
#       print '<pre>'.Dumper(\%in).'</pre>';
 #       print Dumper($postData);
		{
			if ($self->{'UModel'}->checkLogForm($postData))
			{
                #if(!$self->{'UModel'}->isEmailExists($postData))
                #{
				#print 'Registriruem';
					#$self->{'UModel'}->addUser($postData);
                    #	}

			}
			else
			{
                #parsim placeholder;
#				print 'Vivodim Formu s oshibkami';
			}
		}
	}

}

sub new
{
    my $class = ref($_[0])||$_[0];
	
    return bless {'UModel' => $_[1],'AModel' => $_[2],'View'=> $_[3]}; $class;
}
1;
