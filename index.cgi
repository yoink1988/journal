#!d:/xampp/Dwimperl/perl/bin/perl.exe

###!/usr/bin/perl
use strict;
use warnings;
use Data::Dumper;
use CGI qw(:cgi-lib :escapeHTML :unescapeHTML);
use CGI::Carp qw(fatalsToBrowser);
use vars qw(%in);
$|=1;
ReadParse();


use Utils::File;
use Utils::Router;
use Models::Article;
use Models::User;
use Controllers::Home;
use Controllers::Register;
use Utils::Db;
use Views::View;
use Utils::Validate;
use Controllers::Cabinet;
use Controllers::Login;
use Controllers::Profile;


#print "Content-type: text/html; charset=utf-8\n\n";
# print dirname(__FILE__);



#print '<pre>'.Dumper(\%in).'</pre>';

my $router = Utils::Router->new();
my $page = $router->selectPage();

my $db = Utils::Db->new;
my $AMod = Models::Article->new($db);
my $Valid = Utils::Validate->new;
# my $cgi = CGI->new;
my $UMod = Models::User->new($db, $Valid);
my $fh = Utils::File->new();
my $View = Views::View->new($fh);


if($page eq 'home')
{
	my $app = Controllers::Home->new($UMod, $AMod, $View);
	$app->run();
	# print "Content-type: text/html; charset=utf-8\n\n";
	print $app->{'Umodel'}->{'cgi'}->{'header'}."\n\n";
	print $app->{'View'}->getHtml();
}
if($page eq 'Register')
{
	my $app = Controllers::Register->new($UMod, $AMod, $View);
	$app->run();
	print $app->{'View'}->getHtml();
}
if($page eq 'Cabinet')
{
	my $app = Controllers::Cabinet->new($UMod, $AMod, $View);
	$app->run();
	print $app->{'View'}->getHtml();
}
if($page eq 'Login')
{
	my $app = Controllers::Login->new($UMod, $AMod, $View);
	$app->run();
	print $app->{'View'}->getHtml();
}
if($page eq 'Profile')
{
	my $app = Controllers::Profile->new($UMod, $AMod, $View);
	$app->run();
	print $app->{'View'}->getHtml();
}








