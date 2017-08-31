package Controllers::Register;

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
    
	my $req_meth = %ENV->{'REQUEST_METHOD'};
    #print '<pre>'.Dumper(\%ENV).'</pre>';
    #print '<pre>'.Dumper(\%in).'</pre>';

	if($req_meth eq 'GET')
	{
        $self->{'View'}->read('templates/regist.html'); 
       
	}
	if($req_meth eq 'POST')
	{
        my $postData = \%in;
        print '<pre>'.Dumper(\%in).'</pre>';
        print Dumper($postData);
#		print 'CheckForm';
		{
			if ($self->{'UModel'}->checkForm($postData))
			{
                
				print 'Registriruem';
                #add to bd
                #redirect to home with logged_status

			}
			else
			{
                #parsim placeholder;
#				print 'Vivodim Formu s oshibkami';
			}
		}
	}
    

#	print '<pre>'.Dumper(\%ENV).'</pre>';
}

sub new
{
    my $class = ref($_[0])||$_[0];
	
    return bless {'UModel' => $_[1],'AModel' => $_[2],'View'=> $_[3]}; $class;
}
1;
