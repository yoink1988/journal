package Models::Article;

use strict;
use warnings;
use Data::Dumper;


sub getArticles
{
	
	my ($self) = shift;
	#$self->{'Db'}->print();
	my $query = 'select a.id, a.title, a.body, a.date, u.name as author from articles a inner join users u on a.id_author = u.id order by date';
	#print '<pre>'.Dumper($self->{'Db'}).'</pre>';
	my $data = $self->{'Db'}->select($query);
}

sub getArticlesByUsId
{}

sub getArticleById
{}



sub new
{
    my $class = ref($_[0])||$_[0];
	
    return bless {'Db' => $_[1]}; $class;
}
1;
