#!/usr/bin/perl
use File::Basename;
use FindBin '$Bin';
use strict;
use warnings;
use Term::ANSIColor;
use URI::Escape;
use HTML::Entities;
use HTTP::Request::Common;
use Digest::MD5;
use MIME::Base64;
## Copy@right Alisam Technology see License.txt

## INTRODUCTION ###########################################################################################
#   This script is Copyright (c) 2015 Alisam Technology
#   [::] SCRIPT NAME:  atscan scanner
#   [::] Edit: delosemre / BlinkCursor
## DESCRIPTION ###########################################################################################
# Topluluk hatalari ve guvenlik aciklari icin motorlari, dorklari ve siteleri tarama araci.
# Arama motoru
# XSS tarayici.
# LFI / ADF tarayici.
# Sunucuda wordpress ve Joomla sitelerine filtre uygulayin.
# Yönetici sayfasini bulun.
# MD5 + Base64 kodunu coz / kodla.
# Baglanti noktalarini tara.
# Sitelerdeki e-postalari tara.
# Proxy kullan.
# Rasgele kullanici araci.
# Rastgele vekil.
# Tarama hatalari.
# Cms tespit et.
# Çoklu anlik taramalar.
# Extern komutlari calıstirma.
# BlackArch Linux Platformunda Degistirilebilir.
# Butun platformlarda calısir.
# Perl gerekli!
##########################################################################################################

## CHECK INC DIR 
if (!-d $Bin."/inc") {
  print "[!] Hicbir bilesen bulunamadi..\n";
  print "[!] Bilesenler indiriliyor Lutfen bekleyiniz..\n";
  system("git clone https://github.com/delosemre/AtscanTR.git $Bin/atscan_update");
  if (-e "$Bin/atscan.pl") {
    system("chmod +x $Bin/atscan.pl");
    unlink "$Bin/atscan.pl";
  }
  mkdir "$Bin/inc", 0755 or die "cannot write in $Bin!";
  system "sudo cp -r $Bin/atscan_update/* $Bin/";
  system "rm -rf $Bin/atscan_update";  
  if (!-d "$Bin/inc") { print "\n[!] Cannot connect to the server!\n"; exit(); }
  system("chmod +x $Bin/atscan.pl | perl $Bin/atscan.pl --update || atscan --update");
}

## ALL ARRAYS
our (@c, @XSS, @LFI, @RFI, @ADFWP, @ADMIN, @SUBDOMAIN, @UPLOAD, @ZIP, @TT, @OTHERS, @AUTH, @ErrT, @DT, @DS, @cms, @SCAN_TITLE, @E_MICROSOFT, @E_ORACLE, @E_DB2, @E_ODBC, @E_POSTGRESQL, @E_SYBASE,
     @E_JBOSSWEB, @E_JDBC, @E_JAVA, @E_PHP, @E_ASP, @E_LUA, @E_UNDEFINED, @E_MARIADB, @E_SHELL, @strings, @browserlangs, @googleDomains, @Ids, @MsIds, @sys, @vary, @buildArrays, @dorks, @z, @ZT, 
     @userArraysList, @exploits, @data, @proxies, @aTsearch, @aTscans, @aTtargets, @aTcopy, @ports, @motor, @motors, @systems, @mrands, @allMotors, @V_WP, @V_JOOM, @V_TP, @V_SMF, @V_VB, @V_MyBB,
     @V_CF, @V_DRP, @V_PN, @V_AT, @V_PHPN, @V_MD, @V_ACM, @V_SS, @V_MX, @V_XO, @V_OSC, @V_PSH, @V_BB2, @V_MG, @V_ZC, @V_CC5, @V_OCR, @V_XSS, @V_LFI,@V_TODO, @V_AFD, @TODO, @V_VALID, @ERR, @CMS)=();

## TOP CONFIG
require "$Bin/inc/top.pl";

## VARIABLES 
our ($Version, $logoVersion, $scriptUrl, $logUrl, $ipUrl, $conectUrl, $script, $script_bac, $scriptbash, $paylNote, $psx, $updtd, $V_EMAIL, $V_IP, $V_RANG, $V_SEARCH, $V_REGEX,
     $S_REGEX, $motor1, $motor2, $motor3, $motor4, $motor5, $motorparam, $mrand, $pat2, $nolisting, $Hstatus, $validText, $WpSites, $JoomSites, $xss, $lfi, $JoomRfi, $WpAfd, $adminPage, $subdomain,
     $mupload, $mzip, $eMails, $command, $mmd5, $mencode64, $mdecode64, $port, $msites, $mdom, $Target, $exploit, $p, $tcp, $udp, $full, $proxy, $prandom, $help, $output, $replace, $with, $dork,
     $mlevel, $unique, $shell, $nobanner, $beep, $ifinurl, $noinfo, $motor, $timeout, $limit, $checkVersion, $searchIps, $regex, $searchRegex, $noQuery, $ifend, $uninstall, $post, $get, $brandom,
     $data, $payloads, $mrandom, $content, $scriptComplInstall, $scriptCompletion, $scriptInstall, $toolInfo, $config, $freq, $headers, $msource, $noping);

## ARGUMENTS
use Getopt::Long qw(GetOptions);
our %OPT;
Getopt::Long::GetOptions(\%OPT, 'status=s'=>\$Hstatus, 'valid|v=s'=>\$validText, 'wp'=>\$WpSites, 'joom'=>\$JoomSites, 'sql'=>\$xss, 'lfi'=>\$lfi, 'joomrfi'=>\$JoomRfi, 'wpafd'=>\$WpAfd,
                         'admin'=>\$adminPage, 'shost'=>\$subdomain, 'upload'=>\$mupload, 'zip'=>\$mzip, 'email'=>\$eMails, 'command|c=s'=>\$command, 'md5=s'=>\$mmd5, 'encode64=s'=>\$mencode64,
                         'decode64=s'=>\$mdecode64, 'port=s'=>\$port, 'sites'=>\$msites, 'host'=>\$mdom, 't=s'=>\$Target, 'exp|e=s'=>\$exploit, 'p=s'=>\$p, 'tcp'=>\$tcp, 'udp'=>\$udp, 'full'=> \$full,
                         'proxy=s'=>\$proxy, 'proxy-random=s'=>\$prandom, 'help|h|?'=>\$help, 'save|s=s'=>\$output, 'replace=s'=>\$replace, 'with=s'=>\$with, 'dork|d=s'=>\$dork, 'level|l=s'=>\$mlevel,
                         'unique'=>\$unique, 'shell=s'=>\$shell, 'nobanner'=>\$nobanner, 'beep'=>\$beep, 'ifinurl=s'=>\$ifinurl, 'noinfo'=>\$noinfo, 'm=s'=>\$motor, 'timeout=s'=>\$timeout,
                         'limit=s'=>\$limit, 'update'=>\$checkVersion, 'ip'=>\$searchIps, 'regex=s'=>\$regex, 'sregex=s'=> \$searchRegex, 'noquery'=> \$noQuery, 'ifend'=>\$ifend,
                         'uninstall'=> \$uninstall, 'post'=>\$post, 'get'=>\$get, 'b-random'=>\$brandom, 'data=s'=>\$data, 'payload=s'=>\$payloads, 'm-random'=>\$mrandom, 'content'=>\$content,
                         'updtd'=>\$updtd, 'tool'=>\$toolInfo, 'config'=>\$config, 'freq=s'=>\$freq, 'header=s'=>\$headers, 'source=s'=>\$msource, 'noping'=>\$noping) or badArgs();

## INCLUDES
require "$Bin/inc/includes.pl";

## EXIT
require "$Bin/inc/bottom.pl";
