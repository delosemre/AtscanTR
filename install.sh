#!/bin/bash
#
#############################################################################################
# Atscan Install script.
# Install tool in linux os.
# Alisam Technology 2015
#############################################################################################
# PATHs:
# Parent directory => User choice.
# /inc/conf/atscan => /etc/bash_completion.d/atscan
# Sym link in /usr/bin/atscan
# Readme /usr/share/doc/atscan/README.md
# Desktop entry /usr/share/applications/atscan
# Icons /usr/share/icons/hicolor/
# License /usr/share/doc/atscan/License.txt
#############################################################################################
##
echo "[ ]=======================================================================[ ]";
echo "[ ]                      ALISAM  TECHNOLOGY                               [ ]";
echo "[ ]                   Atscan Tool Install Script                          [ ]";
echo "[ ]=======================================================================[ ]";
echo "[ ]           Topluluk hatalari ve guvenlik aciklari icin 	 	[ ]";
echo "[ ]           motorlari, dorklari ve siteleri tarama araci. 		[ ]";
echo "[ ]              delosemre tarafindan TR editlenmistir.			[ ]";
echo "[ ]                       BlinkCursor.org					[ ]";
echo "[ ]                     instagram: delosemree           			[ ]";
echo "[ ]                      Twitter: delosemre 				[ ]";
echo "[ ]=======================================================================[ ]";

echo "";

### Check system compatibility
if [ -d "/usr/bin/" ];
then
echo "[!] Install.sh Atscan aracini sisteminize yukleyin? [y/n]: ";
read baba
if [ "$baba" == "y" ] || [ "$baba" == "Y" ] || [ -z "$baba" ]; 
  then
    echo " "
  else
    echo "[!] Kurulum iptal edildi!";
    exit
fi

### Setting instalation path
current=`pwd`
echo "[!] ATSCAN nereye yuklemek istersiniz?";
echo "[!] Varsayilan dizini kullanmak icin enter tusuna basin veya yolu ayarlayin [$current]: "
read refdir
if [ -z "$refdir" ];
then
 refdir=`pwd`;
fi

if [ ! -d $refdir ];
then
  until [ -d $refdir ];
  do
   echo "[!] $refdir bulunmuyor!!";
   echo "[!] Varsayilan dizini kullanmak icin enter tusuna basin veya yolu ayarlayin  [$current]: "
   read refdir
  done
fi
### Checkin previous instalation
echo "[i] Dizinler kontrol ediliyor..."
if [ -e "/usr/bin/atscan" ];
then
echo "[!] Onceki bir kurulum /usr/bin/! Degistirmek istiyor musun? [y/n]: "
read mama
if [ "$mama" == "y" ] || [ "$mama" == "Y" ] || [ -z "$mama" ];  
then
 rm "/usr/bin/atscan"
else
 echo "[!] Kurulum iptal edildi!";
 exit
fi
fi

## Begin instalation
echo "[i] Yukleniyor...";
 
if [ ! -d "$current/inc" ] || [ ! -e "$current/atscan.pl" ];
then
 echo "[i] Eksik bagımliliklari indirme...";
 git clone https://github.com/delosemre/AtscanTR.git $refdir/atscan_install;
 cp -r $refdir/atscan_install/* $refdir/;
else
  if [ $current != $refdir ];
  then
    echo "[i] Dosyalari tasima $refdir ...";
    cp -r $current/* $refdir/;
  fi
fi 
 
 sleep 1 && echo "[i] Sembolik baglanti olusturma...";
 echo "#!/bin/bash 
 perl $refdir/atscan.pl" '${1+"$@"}' > atscan;
 chmod +x atscan;
 sudo cp atscan /usr/bin/;
 rm atscan;
 sleep 1 && echo "[i] Tamamlama olusturma baglantisi...";
 if [ -d "/etc/bash_completion.d" ] ;
 then
   chmod +x $refdir/inc/conf/atscan;
   sudo cp $refdir/inc/conf/atscan /etc/bash_completion.d/;
 fi
 
 if [ ! -d "/usr/share/applications" ]; 
 then
   mkdir "/usr/share/applications";  
 fi
 chmod +x "/usr/share/applications";
 sudo cp $refdir/inc/conf/desktop/atscan.desktop /usr/share/applications/atscan.desktop;

 if [ ! -d "/usr/share/icons" ]; 
 then
   mkdir "/usr/share/icons";  
 fi
 chmod +x "/usr/share/icons";
 
 if [ ! -d "/usr/share/icons/hicolor" ]; 
 then
   mkdir "/usr/share/icons/hicolor";  
 fi
 chmod +x "/usr/share/icons/hicolor";
 
 
 if [ ! -d "/usr/share/icons/hicolor/16x16" ]; 
 then
   mkdir "/usr/share/icons/hicolor/16x16";  
 fi
 chmod +x "/usr/share/icons/hicolor/16x16";
 if [ ! -d "/usr/share/icons/hicolor/16x16/apps" ]; 
 then
   mkdir "/usr/share/icons/hicolor/16x16/apps";  
 fi
 chmod +x "/usr/share/icons/hicolor/16x16/apps";
 sudo cp $refdir/inc/conf/desktop/16x16/atscan-menu.png /usr/share/icons/hicolor/16x16/apps/;
 
 if [ ! -d "/usr/share/icons/hicolor/22x22" ]; 
 then
   mkdir "/usr/share/icons/hicolor/22x22";  
 fi
 chmod +x "/usr/share/icons/hicolor/22x22";
 if [ ! -d "/usr/share/icons/hicolor/22x22/apps" ]; 
 then
   mkdir "/usr/share/icons/hicolor/22x22/apps";  
 fi
 chmod +x "/usr/share/icons/hicolor/22x22/apps";
 sudo cp $refdir/inc/conf/desktop/22x22/atscan-menu.png /usr/share/icons/hicolor/22x22/apps/;
 
 if [ ! -d "/usr/share/icons/hicolor/24x24" ]; 
 then
   mkdir "/usr/share/icons/hicolor/24x24";  
 fi
 chmod +x "/usr/share/icons/hicolor/24x24";
 if [ ! -d "/usr/share/icons/hicolor/24x24/apps" ]; 
 then
   mkdir "/usr/share/icons/hicolor/24x24/apps";  
 fi
 chmod +x "/usr/share/icons/hicolor/24x24/apps";
 sudo cp $refdir/inc/conf/desktop/24x24/atscan-menu.png /usr/share/icons/hicolor/24x24/apps/;
 
 if [ ! -d "/usr/share/icons/hicolor/48x48" ]; 
 then
   mkdir "/usr/share/icons/hicolor/48x48";  
 fi
 chmod +x "/usr/share/icons/hicolor/48x48";
 if [ ! -d "/usr/share/icons/hicolor/48x48/apps" ]; 
 then
   mkdir "/usr/share/icons/hicolor/48x48/apps";  
 fi
 chmod +x "/usr/share/icons/hicolor/48x48/apps";
 sudo cp $refdir/inc/conf/desktop/48x48/atscan-menu.png /usr/share/icons/hicolor/48x48/apps/;
 
 if [ ! -d "/usr/share/icons/hicolor/256x256/" ]; 
 then
   mkdir "/usr/share/icons/hicolor/256x256/";  
 fi
 chmod +x "/usr/share/icons/hicolor/256x256/";
 if [ ! -d "/usr/share/icons/hicolor/256x256//apps" ]; 
 then
   mkdir "/usr/share/icons/hicolor/256x256//apps";  
 fi
 chmod +x "/usr/share/icons/hicolor/256x256//apps";
 sudo cp $refdir/inc/conf/desktop/256x256//atscan-menu.png /usr/share/icons/hicolor/256x256//apps/;
 
 ########
 
 if [ ! -d "/usr/share/doc/atscan" ]; then
   mkdir "/usr/share/doc/atscan";
 fi
 ######## 
 
 sleep 1 && echo "[i] README.md dosyasini kopyalama /usr/share/doc/atscan...";
 chmod +x "/usr/share/doc/atscan/";
 chmod +x $refdir/README.md;
 sudo cp $refdir/README.md /usr/share/doc/atscan/;
 sleep 1 && echo "[i] License.txt dosyasina kopyalanacak /usr/share/doc/atscan...";
 chmod +x $refdir/License.txt;
 sudo cp $refdir/License.txt /usr/share/doc/atscan/;
 echo "[i] Kurulum dosyalarini kaldirma...";
 rm $refdir/inc/conf/atscan;
 rm $refdir/install.sh;
 if [ -d "$refdir/atscan_install" ];
 then
   rm -r $refdir/atscan_install;
 fi
 rm $refdir/README.md;
 if [ -d "$refdir/inc/conf/desktop" ]; 
 then
   rm -r $refdir/inc/conf/desktop;
 fi
 if [ -e "$refdir/atscan" ] || [ -e "$refdir/atscan.pl" ];
 then
 sleep 1 && echo "[!] Tool successfully installed";
 echo "[i] Updating tool.. ";
 sleep 2;
 atscan --update;
else
 echo "[!] Yukleme basarisiz!! ";
 exit
fi
else
 echo "Arac sisteminize kurulamiyor! Tasinabilir olarak kullan!";
fi

### last update 17/05/2017
