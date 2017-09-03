package Controllers::Cabinet;

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
			my $sid = $self->{'UModel'}->{'cgi'}->cookie("SID");
			my $sess = new CGI::Session(undef, $sid, {Directory=>'tmp'}); 
			my $uId = $sess->param('uId');
			
#			print "Content-type: text/html; charset=utf-8\n\n";
#			print Dumper($uId);
			my $templateName = 'templates/cabinet/cabinet.html';
			$self->{'View'}->read($templateName);
			my $req_meth = %ENV->{'REQUEST_METHOD'};

			if($req_meth eq 'POST')
			{
               my $postData = \%in; 
				$self->{'AModel'}->editArticle($postData);
				$self->{'View'}->parseFormArticle({FORM_EditArticle => ''});
			}
				my $id = %in->{'id'};
				if($id eq undef)
				{
					$self->{'View'}->parseFormArticle({FORM_EditArticle => ''});
				}
				else
				{
					my $formValues = $self->{'AModel'}->getArticleById($id);
					my @formValues = @$formValues;
					my %hash;
					foreach my $val(@formValues)
					{
						%hash->{LANG_title} = $val->{'title'};
						%hash->{LANG_body} = $val->{'body'};
						%hash->{LANG_id} = $val->{'id'};
					}
					$self->{'View'}->parseFormArticle({FORM_EditArticle => $self->{'View'}->makeFormEditArticle(\%hash)});

			}
			my $data = $self->{'AModel'}->getUserArticles($uId);
			my @data = @$data;	
			$self->{'View'}->parsePage(@data);
		}
		else
		{
			print $self->{'cgi'}->redirect(-url => 'index.cgi');
		}
}


sub new
{
    my $class = ref($_[0])||$_[0];
    return bless {'UModel' => $_[1],'AModel' => $_[2],'View'=> $_[3]}; $class;
}
1;
