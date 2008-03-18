#!/usr/bin/perl -w

# be careful with what you do
use strict;

use Getopt::Long;
my ($xmlfile,$format,$db,$debug)
  =(undef,   undef,  undef, 0);
GetOptions("xmlfile=s"   => \$xmlfile,
           "format=s"    => \$format,
           "db=s"        => \$db,
	   "debug"       => \$debug)
or Getopt::Long::HelpMessage(2);



# BioPerl knows how to retrieve protein sequences from the Internet
use Bio::SeqIO;

# XML knows how to "understand" our data
use XML::Parser;
use XML::SimpleObject;

# the input file is for now set statically
$xmlfile = 'apibaso_test.xml' unless defined($xmlfile);

# a parser for the input file is created
my $parser = XML::Parser->new(ErrorContext => 2, Style => "Tree");
my $xso = XML::SimpleObject->new( $parser->parsefile($xmlfile) );

# initialise export format of protein sequences
$format="fasta" unless defined($format);
$db="swissprot" unless defined($db);
my %params = ( '-format' => $format);
my $remotedb;
# create communicator with remote protein database SWISS-PROT (-> UniProt)
eval {
    require Bio::DB::SwissProt;
    $remotedb = Bio::DB::SwissProt->new();
};
die($@) unless ! $@;

my $f=undef;
my $fname;
for $fname ("adam10_adam17","adam10","adam17","unknown","other") {
   my $fname2 = "$fname.complete.fasta";
   if ( -r $fname2) {
	unlink($fname2)      or die "Could not remove file $fname2\n";
   }
}

# iterate over all entries in our data
foreach my $variant ($xso->child('sol:variantlist')->children('sol:variant')) {
    my $err=0;
    # comments to appear on the screen - progress indicators
    print $variant->attribute('gene')."\n";
    if (!defined($variant->attribute('gene'))) {
    	print "  Undefined location!\n";
	$err++;
    }
    if (!defined($variant->attribute('UniProt')) or "" eq $variant->attribute('UniProt')) {
    	print "  Undefined or empty UniProt accession number!\n";
	$err++;
    }
    if (0<$err) {
    	print "  Skipping entry.\n\n";
    	next;
    }
    print $variant->attribute('UniProt');
    print "\n";
    
    # show retrieved protein sequence
    my $stream;
    #if( $remotedb->can('get_Stream_by_batch') ) {
    #    $stream = $remotedb->get_Stream_by_batch($variant->attribute('UniProt'));
    #} else {
        $stream = $remotedb->get_Stream_by_acc($variant->attribute('UniProt'));
    #}

    my $f=undef;
    # schaue was in location steht
    if (defined($variant->attribute('shedBy')) and $variant->attribute('shedBy') =~ /ADAM17/ 
					       and $variant->attribute('shedBy') =~ /ADAM10/) {
    # output file is dies
    	open($f, ">>adam10_adam17.complete.fasta") or die "Could not open file adam10_adam17.complete.fasta for writing\n";
    }
    elsif (defined($variant->attribute('shedBy')) and $variant->attribute('shedBy') =~ /ADAM17/) {
    # sonst jenes
	open($f,">>adam17.complete.fasta") or die "Could not open file adam17.complete.fasta for writing\n";
    }
    elsif (defined($variant->attribute('shedBy')) and $variant->attribute('shedBy') =~ /ADAM10/) {
    # sonst jenes
	open($f,">>adam10.complete.fasta") or die "Could not open file adam10.complete.fasta for writing\n";
    }
    elsif (defined($variant->attribute('notshedBy')) and $variant->attribute('notshedBy') eq "any") {
    # sonst jenes
	open($f,">>unshed.complete.fasta") or die "Could not open file unshed.complete.fasta for writing\n";
    }
    elsif (defined($variant->attribute('shedBy')) and $variant->attribute('shedBy') ne "") {
    # sonst jenes
	open($f,">>other.complete.fasta") or die "Could not open file other.complete.fasta for writing\n";
    }
    # und bei anderen Sonderfällen das
    else {
	open($f,">>unknown.complete.fasta") or die "Could not open file unknown.complete.fasta for writing\n";
        ## set output file
        #$f = \*STDOUT;
    }
    $params{'-fh'} = $f;

    # empty stream of sequences (it is only a single one) to the prior determined file
    my $seqio = new Bio::SeqIO(%params);
    while( my $seq = $stream->next_seq ) {
        $seqio->write_seq($seq);
    }
    close($f);
}

__END__

=head1 NAME

apibaso_filter -  Use XML file to retrieve entries from UniProt database.

=head1 SYNOPSIS

to be written

=head1 OPTIONS

to be written

=head1 DESCRIPTION

The XML file describing protein location refers to the UniProt accession number and entry IDs. The protein sequence however is not explicitly stored. This script reads the entry and downloads the sequences online.

=head1 AUTHOR

Juliane Jäpel and Steffen Möller <moeller@inb.uni-luebeck.de>

=head1 COPYRIGHT

This programs is Copyright 2005-2008, by Juliane and Steffen.

=cut

