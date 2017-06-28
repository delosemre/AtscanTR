#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
use File::Path;
## Copy@right Alisam Technology see License.txt

## CHECK VERSION AND UPDATE
our ($scriptUrl, $script_bac, $script, $logUrl, $scriptv, $userSetting, $scriptInstall, $scriptComplInstall, $scriptCompletion, $scriptbash, $readme,
     $uplog, $fulldate, @userSetting, @ErrT, @DT, @c, @OTHERS, @AUTH, @ZT);
print $c[4]."[i] $OTHERS[20]\n";
my ($same, $response)=compareme();
if ($same eq "yes") {   
  print $c[3]."$DT[6]\n";
}else{
  if (-e $userSetting) {
    print $c[10]."[i] $ZT[0] ";
    open my $dle, '<', $userSetting or nochmod($userSetting, "");
    chomp(@userSetting = <$dle>);
    close $dle;
    cc();
  }
    
  my ($r, $ht, $stats, $serverh)=getHtml($scriptUrl, "");
  if (!$r->is_success) { print "\n"; dd(); exit(); }
    
  print $c[10]."[i] $ZT[1] ";
  open (LE, '>', $script) or nochmod($script, "exit");
  print LE $r->content; close(LE);
  cc();
    
  print $c[10];
  system("git clone https://github.com/delosemre/AtscanTR.git $Bin/atscan_update");
  if (!-d "$Bin/atscan_update") { print "\n"; dd(); exit(); }
  print $c[10]."[i] $ZT[2] ";
  system "sudo cp -r $Bin/atscan_update/inc $Bin";
  if (!-d "$Bin/inc") { bb(); exit(); }
  else{ cc(); }
  
   print $c[10]."[i] Masaustu girdileri olusturma....\n";
  if (-d "/usr/share/applications/") {
    if (!-e "/usr/share/applications/atscan.desktop") {
	  system "sudo cp $Bin/atscan_update/inc/conf/desktop/atscan.desktop /usr/share/applications/";
	} 
  }
  
  if (-d "/usr/share/icons/hicolor/16x16/apps/") {
    if (!-e "/usr/share/icons/hicolor/16x16/apps/atscan-menu.png") {
	  system "sudo cp $Bin/atscan_update/inc/conf/desktop/16x16/atscan-menu.png /usr/share/icons/hicolor/16x16/apps/";
	  if (!-e "/usr/share/icons/hicolor/16x16/apps/atscan-menu.png") { print $c[3]."[!] Error cannot whrite in /usr/share/icons/hicolor/16x16/apps/!\n"; }
	}
	
	if (!-e "/usr/share/icons/hicolor/22x22/apps/atscan-menu.png") {
	  system "sudo cp $Bin/atscan_update/inc/conf/desktop/22x22/atscan-menu.png /usr/share/icons/hicolor/22x22/apps/";
	  if (!-e "/usr/share/icons/hicolor/22x22/apps/atscan-menu.png") { print $c[3]."[!] Error cannot whrite in /usr/share/icons/hicolor/22x22/apps/!\n"; }
	}
	
	if (!-e "/usr/share/icons/hicolor/24x24/apps/atscan-menu.png") {
	  system "sudo cp $Bin/atscan_update/inc/conf/desktop/24x24/atscan-menu.png /usr/share/icons/hicolor/24x24/apps/";
	  if (!-e "/usr/share/icons/hicolor/24x24/apps/atscan-menu.png") { print $c[3]."[!] Error cannot whrite in /usr/share/icons/hicolor/24x24/apps/!\n"; }
	}
	
	if (!-e "/usr/share/icons/hicolor/48x48/apps/atscan-menu.png") {
	  system "sudo cp $Bin/atscan_update/inc/conf/desktop/48x48/atscan-menu.png /usr/share/icons/hicolor/48x48/apps/";
	  if (!-e "/usr/share/icons/hicolor/48x48/apps/atscan-menu.png") { print $c[3]."[!] Error cannot whrite in /usr/share/icons/hicolor/48x48/apps/!\n"; }
	}
	
	if (!-e "/usr/share/icons/hicolor/256x256/apps/atscan-menu.png") {
	  system "sudo cp $Bin/atscan_update/inc/conf/desktop/256x256/atscan-menu.png /usr/share/icons/hicolor/256x256/apps/";
	  if (!-e "/usr/share/icons/hicolor/256x256/apps/atscan-menu.png") { print $c[3]."[!] Error cannot whrite in /usr/share/icons/hicolor/256x256/apps/!\n"; }
	}
  }
  
  my @f=("README.md", "License.txt");
  for my $f(@f) {
    print $c[10]."[i] $ZT[5] $f to $readme/... ";
    system "sudo cp -r $Bin/atscan_update/$f /usr/share/doc/atscan/";
    if (!-e "/usr/share/doc/atscan/$f") { bb(); }
    else{ cc(); }
  }
  
  print $c[10]."[i] $ZT[4] ";
  open (FILE, '>>', $scriptv) or nochmod($scriptv, "");
  print FILE "\n"; close(FILE);
  cc();  
    
  if (-e $scriptbash) {
    if (-d $scriptCompletion) {
      my $scbs="$scriptCompletion/atscan";        
      unlink $scbs if -e $scbs;
      print $c[10]."[i] $ZT[5] $scriptComplInstall to $scriptCompletion/... ";
      system "sudo cp $scriptComplInstall $scriptCompletion/";
      if (!-e "$scriptCompletion/atscan") { bb(); }
      else{ cc(); }
    }
  }
  
  print $c[10]."[i] $ZT[9] ";
  open (MN, '>', $uplog) or nochmod($uplog, "");
  print MN "$fulldate"; close(MN);
  sleep(1);
  cc();
  
  unlink $userSetting if -e $userSetting;   
  if (@userSetting) {
    print $c[10]."[i] $ZT[6] ";
    for my $spss(@userSetting) {
      open (FE, '>>', $userSetting) or nochmod($userSetting, "");
      print FE "$spss\n"; close(FE);
    }
    cc();
  }
  
  print $c[10]."[i] Removing Desktop entries ";
  system "rm -rf $Bin/inc/conf/desktop";
  if (!-d "$Bin/inc/conf/desktop") { cc(); }
  else{ bb(); }

  print $c[10]."[i] $ZT[7] ";
  system "rm -rf $Bin/atscan_update";
  if (!-d "$Bin/atscan_update") { cc(); }
  else{ bb(); }
    
  my @unlinks=($scriptComplInstall, $scriptInstall, $Bin."/README.md", $Bin."/License.txt", $script_bac);
  for my $unlink(@unlinks) {
    print $c[10]."[i] $ZT[8] $unlink... ";
    unlink $unlink if -e $unlink;
    if (!-e $unlink) { cc(); }      
  }
  
  sleep(1);
  print $c[3]."[i] $DT[7]\n";
  print "$c[10]\n".$response->content.""; 
  if (substr($0, -3) ne '.pl') {
    my $zs=$script.".pl";
    unlink $zs if -e $zs or nochmod($zs, "");
  }
}

1;