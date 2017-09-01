package Models::Article;

use strict;
use warnings;
use Data::Dumper;


sub getArticles
{
	my ($self) = shift;
	my $query = 'select a.tittle, a.body, a.date, u.name as author, u.id as auth_id from articles a inner join users u on a.id_author = u.id order by date';
	return $self->{'Db'}->select($query);
}

sub getUserArticles
{
 #\@arr getUserArticles($idUser)
 my ($self, $idUser) = @_;
 my $query = 'SELECT id, tittle, body, date FROM articles WHERE id_author=\''.$idUser.'\'';
 return $self->{'Db'}->select($query);
}

sub getArticleById
{
 #\@arr getArticleById($artId)
 my ($self, $artId) = @_;
 my $query = 'SELECT id, tittle, body FROM articles WHERE id=\''.$artId.'\'';
 return $self->{'Db'}->select($query);
}


sub new
{
    my $class = ref($_[0])||$_[0];
	
    return bless {'Db' => $_[1]}; $class;
}
1;
