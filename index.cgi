#!D:/xampp/Dwimperl/perl/bin/perl.exe

##!D:/xampp/perl/bin/perl.exe

##!/usr/bin/perl/

use strict;
use warnings;
use Data::Dumper;
use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
use CGI::Carp qw(fatalsToBrowser); 
use Utils::File;
use Utils::Router;
use Models::Article;
use Models::User;
use Controllers::Home;
use Controllers::Register;
use Controllers::Auth;
use Utils::Db;
use Views::View;

use vars qw(%in);
$|=1;
ReadParse();

print "Content-type: text/html; charset=utf-8\n\n";

#print '<pre>'.Dumper(\%in).'</pre>';
my $request = \%in;
my $router = Utils::Router->new($request);
my $page = $router->selectPage();

#print Dumper($page);

if($page eq 'home')
{
	my $db = Utils::Db->new;
	my $AMod = Models::Article->new($db);
	my $UMod = Models::User->new($db);
	my $fh = Utils::File->new();
	my $View = Views::View->new($fh);
	my $app = Controllers::Home->new($UMod, $AMod, $View);
	$app->run();
	print $app->{'View'}->getHtml();
}
if($page eq 'register')
{
print 'REG';
	my $db = Utils::Db->new;
	my $AMod = Models::Article->new($db);
	my $UMod = Models::User->new($db);
	my $fh = Utils::File->new();
	my $View = Views::View->new($fh);
	my $app = Controllers::Register->new($UMod, $AMod, $View);
	$app->run();
	print $app->{'View'}->getHtml();
}
if($page eq 'auth')
{
print 'AUTH_PAGE';
	my $db = Utils::Db->new;
	my $AMod = Models::Article->new($db);
	my $UMod = Models::User->new($db);
	my $fh = Utils::File->new();
	my $View = Views::View->new($fh);
	my $app = Controllers::Auth->new($UMod, $AMod, $View);
	$app->run();
	print $app->{'View'}->getHtml();
}








