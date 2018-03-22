#!/bin/perl
#!/usr/bin/perl
# Author: Ercan Selçuk Ünlü
# Simple perl code to for filtering large data sets after target based analysis
# Please contact esunlu06@gmail.com for input file parameters

  open OUT, ">detaledfinal.txt" || (die "detaledfinal.txt unsuccessful");

 open OUTC, ">component.txt" || (die "component.txt unsuccessful");
  open OUTF, ">function.txt" || (die "function.txt unsuccessful");
   open OUTP, ">progress.txt" || (die "progress.txt unsuccessful");
   open OUTS, ">stats.txt" || (die "stats.txt unsuccessful");
open IN1, "input.txt" || (die "input.txt unsuccessful");
 @hashes=<IN1>;
 $i = 0;

open IN2, "goslimlist.txt" || (die "goslimlist.txt unsuccessful");
 @mirs=<IN2>; 
foreach   $hash (@hashes){
	 chomp $hash;
 	$counter++;
	 	
	  ($a, $b, $c, $d, $e, $f, $g, $h, $i, $j, $k, $l,$m, $n, $o, $p,) = split '\t',$hash;
	 print $counter, "\n";
   ($m1, $m2) = split '\.',$m;
#  	 print $b, "\n";
foreach   $mir (@mirs){
	
	$r++;
	 chomp $mir;
  
	 
	  ($aa, $bb, $cc, $dd, $ee, $ff, $gg, $hh, $ii, $jj, $kk, $ll, $mm, $nn, $oo) = split '\t',$mir;


	 		if (($m1 eq $aa)){
	 		 
if ($ee eq "C"){	
			
        print OUTC  $a,"\t","$dd","\t", "$cc",  "\t", "$ee", "\n";    
;
}
if ($ee eq "F"){	
			
        print OUTF  $a,"\t","$dd","\t", "$cc",  "\t", "$ee", "\n";    

		$mmm++;
		
}
if ($ee eq "P"){	
			
        print OUTP  $a,"\t","$dd","\t", "$cc",  "\t", "$ee", "\n";    
		
			$bbb++;
}

 print OUT  "$a",  "\t", "$m", "\t", "$mir", "\n";  
 
}	

	
}
}


print OUTS "Molecular Function: $mmm\t Cellular Component: $ccc\t Biological Process: $bbb", "\t Total:", $mmm+$ccc+$bbb;
