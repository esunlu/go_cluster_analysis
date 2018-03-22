#!/usr/bin/perl
# Author: Ercan Selçuk Ünlü
# Simple perl code to cluster batch go annotation file after target analysis for miRNAs belonging to Triticum monococcum spp. monococcum
# Please contact esunlu06@gmail.com for input file parameters

# 	Molecular Function

  open OUT, ">monococcum_numbers.txt" || (die "monococcum_numbers.txt unsuccessful");
    open OUT2, ">others.txt" || (die "others.txt unsuccessful");
        open OUTMOL, ">mol.txt" || (die "mol.txt unsuccessful");
 open OUTM, ">monococcum_goonly.txt" || (die "monococcum_goonly.txt unsuccessful");
    open OUTM3, ">monococcum_molecularnumbers2.txt" || (die "monococcum_molecularnumbers2.txt unsuccessful");
    open OUTM4, ">monococcum_moleculardetailed.txt" || (die "monococcum_moleculardetailed.txt unsuccessful");
#   Cellular Component   


    open OUTC3, ">monococcum_cellularnumbers2.txt" || (die "monococcum_cellularnumbers2.txt unsuccessful");
    open OUTC4, ">monococcum_cellulardetailed.txt" || (die "exclude.txt unsuccessful");
#   Biological Process 

    open OUTB3, ">monococcum_biologicalnumbers2.txt" || (die "monococcum_biologicalnumbers2.txt unsuccessful");
    open OUTB4, ">monococcum_biologicaldetailed.txt" || (die "monococcum_biologicaldetailed.txt unsuccessful");
open IN2, "gogo.txt" || (die "exclude.txt unsuccessful");
@names=<IN2>;
	foreach  $name (@names){
chomp $name;
	$counter++;
($a, $b, $c, $d, $e, $f, $g,) = split '\^',$name;

print  	OUTM $b, "\n"; 
if ($b eq "molecular_function"){
print  	OUTM3 $a, "\t", $c, "\n";
$gotermdetailedm{$a."\t".$c}++;
$mmm++;

}

if ($b eq "cellular_component"){

print  	OUTC3 $a, "\t", $c, "\n";
$gotermdetailedc{$a."\t".$c}++;
$ccc++;
}
if ($b eq "biological_process"){

print  	OUTB3 $a, "\t", $c, "\n";
$gotermdetailedb{$a."\t".$c}++;
$bbb++;
}
$goterm{$b}++;

}


print $i;
  foreach (sort keys %gotermdetailedm) {
    print OUTM4 $_,"\t", "$gotermdetailedm{$_}\n";
  }
   foreach (sort keys %gotermdetailedc) {
    print OUTC4 $_,"\t", "$gotermdetailedc{$_}\n";
  }
   foreach (sort keys %gotermdetailedb) {
    print OUTB4 $_,"\t", "$gotermdetailedb{$_}\n";
  }
  foreach (sort keys %goterm) {
    print OUT $_,"\t", "$goterm{$_}\n";
  }
	print OUT "Molecular Function: $mmm\t Cellular Component: $ccc\t Biological Process: $bbb", "\t Total:", $mmm+$ccc+$bbb;
  close OUTM4;
   close OUTC4;
    close OUTB4;
   close OUTM3;
   close OUTC3;
    close OUTB3;
    close OUT;
    close OUTM;
  
  
 
