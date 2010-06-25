#!/usr/bin/perl

# twitter.pl
#
# Sends a message to twitter from the command line
#
# (c) 2009 Ivan Chavero <ichavero at chavero.com.mx>
#

=head1 twitter.pl


Sends a message to twitter from the command line

=head1 Requirements

Net::Twitter

Installation of Net::Twitter

perl -MCPAN -e'install Net::Twitter'

=head1 TODO

All the other stuff you can do on twitter ;-)


=head1 AUTHOR

Ivan Chavero <ichavero@chavero.com.mx>

=cut
use warnings;
#use strict;
use Net::Twitter;
use Getopt::Std;


$user = '';
$password = "";
$message = "";

if($#ARGV < 0){
	print "Usage: $0 -u <user> -p <pasword> -t <Text to tweet>\n";
	exit;
}

my %options = ();
getopts('u:p:t:', \%options);

$user = check_option(\%options, 'u');
$password = check_option(\%options, 'p');
$message = check_option(\%options, 't');

my $nt = Net::Twitter->new(
	traits   => [qw/API::REST/],
	username => $user,
	password => $password
);

my $result = $nt->update($message);

#Checks te option and returns the value
#Exits if there is no value on the option

sub check_option {
	my $options = shift;
	my $option = shift;
	if($options->{$option} ne ""){
		return($options->{$option});
	}
	else {
		print "Missing option (-$option)\n";
		exit;
	}
}