#!/user/bin/perl
use strict;
use warnings;
open IN,"<$ARGV[0]" or die $!;
while(<IN>){
 chomp;
 if(/<package/){
      my @tmp = split(/\"/,$_);
      print("\n"."\n".$tmp[1]."\n"."\n"."\n");
  }
  next if !(/result/);
  my $res = '';
  my $flag = 1;
 if(/redirect/){
   #$res ="redirect:";
   $flag = 0;
 }
 my @arr = split(/\"/,$_);
 if($flag == 0 ){ 
  my @tmp = split(/\>|\</,$arr[4]);
   $res = $res.$arr[1].' = "'."redirect:".$tmp[1];
 }else{
    my @tmp = split(/\>|\</,$arr[2]);
    $res = $res.$arr[1].' = "'.$tmp[1].'"';
 }
  my @tt = split(/\.jsp/,$res);
  if($flag==1){
   $res = $tt[0];
 }
  $res = $res.'";';
  print ($res."\n");


}