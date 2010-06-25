#!/usr/bin/perl -w

use warnings;
open(USERS, "/home/user/perl/basics/os/users") or die "Can not open the file \"users\"!!! $!";

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
 
    sub twittear{
    my @args = ("perl", "/home/user/perl/basics/os/twitter.pl", "-u", "usuario", "-p", "passwd", "-t", "Warning!!! User $USER is over allowed usage RAM: $excess MB");
    system(@args) == 0 or die "The arguments are wrong: $?";
    print '-' x 128, "\n";
    }
    
    if($total > 400){
        $excess = $total - 400.00;
        twittear();
    }
}

print '-' x 128, "\n";
