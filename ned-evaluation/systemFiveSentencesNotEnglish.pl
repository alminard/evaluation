#!/usr/bin/perl -w

use XML::LibXML;

use strict;
use locale;

my $sys = $ARGV[0];
my $resource = $ARGV[1];
my $out = $ARGV[2];

my $f = $ARGV[4]."mappings_sys.csv";
open(F,"<:encoding(UTF-8)",$f) or die "can't open $f\n";
my @lines = <F>;
close(F);

my %mappings = ();
foreach my $l (@lines){
    chomp($l);
    my @info = split(/\s/,$l);
    $mappings{$info[0]} = $info[1];
}

my $parser = XML::LibXML->new("1.0", "UTF-8");

opendir(my $dh, $sys) || die "can't opendir $sys: $!";
my @docs = readdir($dh);
closedir $dh;

open(O,">:encoding(UTF-8)", $out) or die "can't open $out file\n";
foreach my $d (@docs){
    if ($d =~ /\.naf$/){
    #if ($d =~ /\.naf$/ or $d =~ /\.xml$/){
	my $docname = $d;
	$docname =~ /(.*)\.naf/;
	$docname = $1 . ".txt.xml.naf";
	my $doc    = $parser->parse_file("$sys/$d");    
	my @wfs = $doc->findnodes("/NAF/text/wf");
	my $sent = 0;
	my $pos = 0;
	my $max = 0;
	while ($pos < $#wfs && $sent <= 6){
	    my $wf = $wfs[$pos];
	    $sent = $wf->getAttribute("sent");
	    if ($sent <= 6){
		my $id = $wf->getAttribute("id");
		$id =~ /w(.*)/;
		$max = $1;
	    }	    
	    $pos++;
	}
	
	foreach my $entity ($doc->findnodes("/NAF/entities/entity")){
	    my $span;
	    my @targets = $entity->findnodes("references/span/target");
	    my $pos = 0;
	    my $h = $targets[0]->getAttribute("id");
	    $h =~ /[^0-9]+([0-9]+)/;
	    $h = $1;
	    if ($h <= $max){
	    #if ($targets[0]->getAttribute("id") <= $max){
		while ($pos < $#targets){
		    my $id = $targets[$pos]->getAttribute("id");
		    $id =~ /[^0-9]+([0-9]+)/;
		    $id = $1;
		    $span .= $id . "-";
		    $pos++;
		}
		#$span .= $targets[$#targets]->getAttribute("id");
		my $h = $targets[$#targets]->getAttribute("id");
		$h =~ /[^0-9]+([0-9]+)/;
		$span .= $1;
		
		my @refs = $entity->findnodes("externalReferences/externalRef");
		if ($#refs >= 0){
		    my @enRefs = $refs[0]->findnodes("externalRef");
		    if ($#enRefs >= 0){
			my $ref = "";
			my $maxconf = 0.0;
			foreach my $cref (@enRefs){
			    if ($cref->getAttribute("resource") eq $resource && ($cref->getAttribute("confidence")+0.0)>$maxconf){
				$maxconf=$cref->getAttribute("confidence");
				$ref=$cref->getAttribute("reference");
			    }
			}
			if ($ref =~ /dbpedia/){
			    $ref =~ /.*\/(.*?)$/;
			    $ref = $1;
			    
			    if ($mappings{$ref}){
				print O "$docname\t$span\t$mappings{$ref}\n";
			    }
			    else{
				print O "$docname\t$span\t$ref\n";
			    }
			    
			}
		    }
		    else{
			print "Not English mapping $docname\t$span\n";
		    }
		}
	    }
	}
    }
}
close(O);
