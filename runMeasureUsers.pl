#!/usr/bin/env perl
use warnings;
#This script works fine with 2 users inside the file "users". With more users take care!!!
open(USERS, "/usr/local/scripts/perl/users") or die "Can not open the file \"users\"!!! $!";

while(my $user = <USERS>){
    chomp(my $USER = $user);

    @procesos = `ps --no-headers -u $USER -o rss,pid,etime,command --sort rss`;
    
    print '-' x 128, "\n";
    print "Data for $USER\n";
    print "Memory(MB)\tPID\tCOMMAND\n";
          
    print '-' x 128, "\n";
    
    foreach my $proc(@procesos){
        my @procesos = (my $stuff, my $mmem, my $pid, my $etimeCommand) = split /(\d+)\s+(\d+)\s+(.+)/, $proc;
        $mem = $mmem / 1024;
        print $mem, "\t",$pid, "\t",$etimeCommand,"\n";
        $memoria{$USER}.= $mem . " ";
    }
    
    foreach $USER(sort keys %memoria){
        $procesos = 0;
        $total = 0;
        my @valores = split(" ", $memoria{$USER});
        
        foreach my $proceso(@valores){
            $procesos++;
            $total += $proceso;
        }
    }
    
    print "Total memory usage for user ", $USER, ":\t", $total, " MB\n";
}

print '-' x 128, "\n";
