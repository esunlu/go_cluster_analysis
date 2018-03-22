#!/usr/bin/perl
# Author: Ercan Selçuk Ünlü
# Simple perl code used for database sorting of N. alba assembly annotation file. The file created by analysis assembled RNA-Seq data with Trinotate tool (trinotate.github.io).
# Please contact esunlu06@gmail.com for input file parameters

 open OUT, ">blastx.txt" || (die "blastx.txt unsuccessful");
 open OUT2, ">blastp.txt" || (die "blastp.txt unsuccessful");
 open OUT3, ">pfam.txt" || (die "pfam.txt unsuccessful");
 open OUT4, ">eggnog.txt" || (die "eggnog.txt unsuccessful");
 open OUT5, ">databasestats.txt" || (die "databasestats.txt unsuccessful");
 open OUT6, ">unigenes.txt" || (die "unigenes.txt unsuccessful");
 open OUT7, ">contigs.txt" || (die "contigs.txt unsuccessful");
 open OUT8, ">goresult2.txt" || (die "goresult2.txt unsuccessful");
 open OUT9, ">goresultforanalysis2.txt" || (die "goresultforanalysis2.txt unsuccessful");
 open IN, "annotation_report.txt" || (die "exclude.txt unsuccessful");
@names=<IN>;
	foreach  $name (@names){
chomp $name;
	
my ($a, $b, $c, $d, $e, $f, $g, $h) = split '\t',$name;

$m++;

if ($c ne "."){
$blastx{$a}++;
$blastxcontig{$b}++;
$total{$a}++;
$totaltt{$b}++;

}
if ($d ne "."){
$blastp{$a}++;
$blastpcontig{$b}++;
$total{$a}++;
$totaltt{$b}++;
}
if (($c ne ".")&&($d ne ".")){

if (($g ne ".")&& ($blastp{$a} < 2)){
$blastxgo{$a."\t".$g}++;
print OUT9 $a,"\t",$d,"\t".$g,"\n";

}
}


if ($e ne "."){
$pfam{$a}++;
$pfamcontig{$b}++;
$total{$a}++;
$totaltt{$b}++;
}
if ($f ne "."){
$eggnogg{$a}++;
$eggnoggcontig{$b}++;
$total{$a}++;
$totaltt{$b}++;
}
}
foreach (sort keys %blastx) {
	if ($blastx{$_}>0){
    print OUT $_,"\t", "$blastx{$_}\n";
    $hh++ 
}
  }
  foreach (sort keys %blastxgo) {
    print OUT8 $_,"\t", "$blastxgo{$_}\n";
    $gogo++ 
    
  }
  foreach (sort keys %blastxcontig) {
      $h++ 
    
  }
  
  foreach (sort keys %blastp) {
    print OUT2 $_,"\t", "$blastp{$_}\n";
    $ii++ 
    
  }
   foreach (sort keys %blastpcontig) {
      $i++ 
    
  }
  foreach (sort keys %pfam) {
    print OUT3 $_,"\t", "$pfam{$_}\n";
    $jj++ 
    
  }
     foreach (sort keys %pfamcontig) {
      $j++ 
    
}
	foreach (sort keys %eggnogg) {
    print OUT4 $_,"\t", "$eggnogg{$_}\n";
    $kk++ 
    
  }
     foreach (sort keys %eggnoggcontig) {
      $k++ 
    
}
  	foreach (sort keys %total) {
    print OUT6 $_,"\t", "$total{$_}\n";
    $tt++ 
    
  }
  	foreach (sort keys %totaltt) {
    print OUT7 $_,"\t", "$totaltt{$_}\n";
    $zz++ 
    
  }
  
  print OUT5 "Database","\t","Contig Number","\t","Unigene Number", "\n";
  print OUT5 "BlastX","\t","$h","\t","$hh", "\n";
  print OUT5 "BlastP","\t","$i","\t","$ii", "\n";
  print OUT5 "Pfam","\t","$j","\t","$jj", "\n";
  print OUT5 "EggNOG","\t","$k","\t","$kk", "\n";
    print OUT5 "TOTAL","\t","$zz","\t","$tt", "\n";
     print OUT5 "GO","\t","$gogo","\n";
