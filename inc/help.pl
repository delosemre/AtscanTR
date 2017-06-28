#!/usr/bin/perl
use strict;
use warnings;
use FindBin '$Bin';
## Copy@right Alisam Technology see License.txt

## HELP
  our (@c);
  print $c[1]."[::] HELP\n";
  ltak();
  print $c[10]
  ."   --proxy       | Taramalar icin proxy'yi ayarla [EX: --proxy \"socks://localhost:9050\"]\n"
  ."                 | proxy ayarla [EX: --proxy \"http://12.45.44.2:8080\"] \n"
  ."                 | proxy  listesi ayarla [EX: --proxy list.txt] \n"
  ."  -m             | Arama motorlarini varsayilan bing EX olarak ayarlayin: -m [Bing: 1][Google: 2][Ask: 3][Yandex: 4][Sogou: 5][All: all]\n"
  ."  --proxy-random | Rastgele proxy [EX: --proxy-random list.txt] or --proxy-random \"socks://localhost:9050\"]\n"
  ."  --m-random     | Tum disponibles motorlarinin rastgele \n"
  ."  --brandom      | Tum disponibles ajanlari rastgele \n"
  ."  --timeout      | Tarayici zaman asimini ayarla (saniye olarak)\n"
  ."  --freq         | Rasgele zaman frekansi (saniye olarak) \n"
  ."  --dork | -d    | Aranacak dork [Or: house [OTHER] cars [OTHER] otel] \n"
  ."  -t             | Hedef \n"
  ."  --level | -l   | Tarama duzeyi (+ - Taranacak sayfa sonuclari sayisi) \n"
  ."  -p             | EX test parametresini ayarlayin:id,cat,product_ID \n"
  ."  --save | -s    | Cikti dosyasi.\n"
  ."  --source       | Html cikti klasoru.\n"
  ."  --content      | Yanit icerigini yazdir.\n"
  ."  --data         | veri. Orneklere bak \n"
  ."  --post         | Posta yontemini kullan \n"
  ."  --get          | Alma yontemini kullan \n"
  ."  --header       | Basliklari ayarla. \n"
  ."  --host         | Alan adi [Ex: site.com] \n"
  ."  --nobanner     | Arac seridini gizle\n"
  ."  --beep         | Pozitif tarama bulunursa uyari sesi cikar.\n"
  ."  --ifend        | Tarama islemi bittiginde bip sesi cikar.\n"
  ."  --noinfo       | Ekstra sonuc bilgisi atla.\n"
  ."  --limit        | Tarama, tanimlanan miktarda pozitif sonuclara ulastiginda duraklatin\n"
  ."  --valid | -v   | Dize olarak dogrulama \n"
  ."  --status       | Http ustbilgi durumuna gore dogrulama \n"
  ."  --ifinurl      | Tam dizeyle eslesen hedefleri alin \n"
  ."  --sregex       | Tam esleme ile eslesen hedefleri alin \n"
  ."  --unique       | Tam dork eslesen hedefleri alin \n"
  ."  --replace      | Degistirilecek dize \n"
  ."  --with         | Ile degistirilecek dizge \n"
  ."  --full         | --replace --full Dizeden tum url parametrelerini sonuna kadar degistirecek\n"
  ."  --payload      | Arac yukleri yerine kendi yuklerini kullan\n"
  ."  --exp          | Exploit/Payload \n"
  ."  --sql          | Xss tarama \n"
  ."  --lfi          | Yerel dosya dahil etme \n"
  ."  --joomrfi      | Joomla yerel dosya icerigini tara.\n"
  ."  --shell        | Shell link [Ex: http://www.site.com/shell.txt] \n"
  ."  --wpafd        | Keyfi dosya indirmek icin wordpress sitelerini tara\n"
  ."  --admin        | Site yonetici sayfasi alin \n"
  ."  --shost        | Site alt alanlari bulun \n"
  ."  --tcp          | TCP port \n"
  ."  --udp          | UDP port \n"
  ."  --sites        | Sunucudaki siteler \n"
  ."  --wp           | Sunucudaki Wordpress siteleri\n"
  ."  --joom         | Sunucudaki joomla siteleri\n"
  ."  --upload       | Sunucuda yukleme dosyalari olan siteleri alin  \n"
  ."  --zip          | Sunucuda zip dosyalari bulunan siteleri alma \n"
  ."  --md5          | Md5'e donusturun \n"
  ."  --encode64     | Base64 dizesini kodla \n"
  ."  --decode64     | Base64 dizgesini cozer \n"
  ."  --TARGET       | Harici komutla hedef tarafindan degistirilecek \n"
  ."  --HOST         | Harici komutla ana bilgisayarla degistirilecek \n"
  ."  --HOSTIP       | Degistirilecek extern komutunda ana bilgisayar IP \n"
  ."  --PORT         | Harici komutla acik port degistirilecek \n"
  ."  --ip           | Ips almak icin tarama yapin\n"
  ."  --regex        | Regex ile eslesen dizeleri almak icin tarama yapin\n"
  ."  --noquery      | Dize degerini Query URL'sinden kaldir [ex: site.com/index.php?id=string] \n"
  ."  --command      | Calistirmak icin Extern Komutanligi\n"
  ."  --email        | E-postalar alin\n"
  ."  rang(x-y)      | Ornek: --exp \"/index.php?id=rang(1-9)\" --sql OR -t \"site.com/index.php?id=rang(1-9)\" --sql\n"
  ."                 | site.com/index.php?id=1->9 \n"
  ."  repeat(txt-y)  | Ornek: --exp \"/index.php?id=repeat(../-9)wp-config.php\" --sql OR -t \"site.com/index.php?id=../wp-config.php\"\n"
  ."                 | In site.com/index.php?id=../wp-config.php then site.com/index.php?id=../../wp-config.php 9 times\n"
  ."  [DATA/DATAFILE]| To separate data values ex: --data \"name:username [DATA]email:xxxxxx [DATA]pass:xxxxx\"\n"
  ."                 | Wordlist: --data \"name:username [DATA]email:xxxx\@xx.com [DATAFILE]pass:\/root/Desktop\/list.txt\"\n"
  ."  [OTHER]        | Diger tum degerleri ayri tutmak icin (dork exploit payload proxy target..) ornek: --dork \"dork1 [OTHER]DORK2 [OTHER]DORK3\"\n"
  ."  --pass         | Arac parolasini ayarlayin veya duzenleyin \n"
  ."  --config       | Yapilandirmayi ayarla. \n"
  ."  --update       | Araci guncelle. \n"
  ."  --uninstall    | Araci kaldir \n\n";

  ltak(); print $c[11]." [::] Ornekler: \n";

  ltak(); print $c[12]."  PROXY: \n".$c[10]
  ."   Tor: --proxy socks://localhost:9050 \n"
  ."   Proxy: --proxy <proxy> [Ex: http://12.32.1.5:8080] | --proxy <list.txt>.\n".$c[10]."\n\n";
  ltak(); print $c[12]."  SET HEADERS: \n".$c[10]
  ."   --header \"Authorization:Basic YWRtaW46YWRtaW4 [OTHER]keep_alive:1\"\n\n" ;
  ltak(); print $c[12]."  RASTGELE \n".$c[10]
  ."   Rastgele proxy: --proxy-random [proxy | list.txt] \n"
  ."   Rastgele ajan: --b-random \n"
  ."   Rasgele motor: --m-random \n\n" ;
  ltak(); print $c[12]."  ARAMA MOTORU: \n".$c[10]
  ."   Arama: atscan --dork <dork> --level <level> \n"
  ."   Arama: atscan -d <dork> -l <level> \n"
  ."   Motor ayarla: atscan --dork <dork> --level <level> -m [Bing: 1][Google: 2][Ask: 3][Yandex: 4][Sogou: 5][All: all]\n"
  ."   Secici motorlari ayarla: atscan -d <dork> -l <level> -m 1,2,3..\n"
  ."   Bircok dork ile arama yapin: atscan --dork <dork1 [OTHER]dork2 [OTHER]dork3> --level <level> \n"
  ."   Arama ve rand: atscan -d <dork> -l <level> --exp \"/index.php?id=rang(1-9)\" --sql\n"
  ."   Sunucu sitelerini edinin: atscan -t <ip> --level <value> --sites\n"
  ."   Sunucu wordpress sitelerini edinin: atscan -t <ip> --level <value> --wp \n"
  ."   Sunucu joomla sitelerini edinin: atscan -t <ipbgn-ipend> --level <value> --joom \n"
  ."   Sunucu yukleme sitelerini edinin: atscan -t <ip> --level <value> --upload \n"
  ."   Server zip sitelerini alin: atscan -t <ip> --level <value> --zip \n"
  ."   WP Arbitry Dosya indirme: atscan -t <ip> --level <value> --wpafd \n"
  ."   Joomla RFI: atscan -t <ip> --level <10> --joomfri --shell <shell link>\n"
  ."   Arama + cikis: atscan --dork <dorks.txt> --level <level> --save\n\n"
  ."   Arama + e-postalari alin: atscan -d <dorks.txt> -l <level> --email \n"
  ."   Arama + site e-postalari alin: atscan --dork <site:site.com> --level <level> --email \n"
  ."   E-postalari belirt: atscan -d <dorks.txt> -l <level> --email -v \"\@gmail | \@yahoo ..\"\n"
  ."   Arama + ips almak: atscan --dork <dork> --level <level> --ip \n\n";

  ltak(); print $c[12]."  DUZENLI IFADELER: \n".$c[10]
  ."   Regex kullanimi: atscan [--dork <dork> | -t <target>] --level <level> --regex <regex>\n"
  ."   IP: ((?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){ 3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?))\n"
  ."   E-mails: ".'((([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})'."\n\n";

  ltak(); print $c[12]."  REPEATER: \n".$c[10]
  ."   atscan -t \"site.com?index.php?id=rang(1-10)\" --sql\n"
  ."   atscan -t <target> --exp \"/index.php?id=rang(1-10)\" --sql\n"
  ."   atscan -t <target> --exp \"/index.php?id=repeat(../-9)wp-config.php\" \n\n";

  ltak(); print $c[12]."  PORTS: \n".$c[10]
  ."   atscan -t <ip> --port <port> [--udp | --tcp] \n"
  ."   atscan -t \(ip start\)-\(ip end\) --port <port> [--udp | --tcp] \n"
  ."   atscan -t <ip> --port \(port start\)-\(port end\) [--udp | --tcp] --command \"Harici komutlar\"\n\n";

  ltak(); print $c[12]."  ENCODE / DECODE: \n".$c[10]
  ."   Generate MD5: --md5 <string> \n"
  ."   Encode base64: --encode64 <string>  \n"
  ."   Decode base64: --decode64 <string> \n\n";
  ltak(); print $c[12]."  POST/GET DATA: \n".$c[10]
  ."  Post data: atscan -t <target> --data \"field1:value1[DATA]field2:value2[DATA]field3:value3\" --post | --get\n"
  ."             atscan -t <target> --data \"username:john[DATA]pass:1234 --post | --get\n"
  ."  Wordlist: atscan -t <target> --data \"name:username [DATA]email:xxxx\@xx [DATAFILE]pass:\/root/Desktop\/list.txt\"\n"
  ."  Post + Validation: --data \"name:userfile[DATAFILE]value:file.txt\" -v <string> | --status <code> --post | --get\n\n";

  ltak(); print $c[12]."  HARICI KOMUTLAR: \n".$c[10]
  ."   atscan --dork <dork | dorks.txt> --level <level> --command \"curl -v --TARGET\" \n"
  ."   atscan --dork <dork | dorks.txt> --level <level> --command \"curl -v --HOST\" \n"
  ."   atscan --dork <dork | dorks.txt> --level <level> --command \"nmap -sV -p 21,22,80 --HOSTIP\" \n"
  ."   atscan -t <target> --port 80 --udp --command \"nmap -sV -p --PORT --TARGET\" \n"
  ."   atscan -d \"index of /lib/scripts/dl-skin.php\" -l 20 -m 2 --command \"php WP-dl-skin.php-exploit.php --TARGET\" \n\n";

  ltak(); print $c[12]."  COKLU TARAMA: \n".$c[10]
  ."   atscan --dork <dork> --level <10> --sql --lfi --wp ..\n"
  ."   atscan --dork <dork> --level <10> --replace <string> --with <string> --exp <exploit> [--sql | --lfi | --wp |...]\n"
  ."   atscan -t <ip> --level <10> [--sql | --lfi | --wp |...]\n"
  ."   atscan -t <targets> [--sql | --lfi | --wp |...]\n\n";

  ltak(); print $c[12]."  PAYLOAD'LARIN KULLANIMI: \n".$c[10]
  ."   atscan --dork <dork> --level <10> [--lfi | --sql ..] --payload <payload | payloads.txt> \n\n";

  ltak(); print $c[12]."  ARAMA VALIDASYONU: \n".$c[10]
  ."   atscan -d <dork | dorks.txt> -l <level> --status <code> | --valid <string> \n"
  ."   atscan -d <dork | dorks.txt> -l <level> --ifinurl <string> \n"
  ."   atscan -d <dork | dorks.txt> -l <level> --regex <regex> --valid <string>\n"
  ."   atscan -d <dork | dorks.txt> -l <level> --unique \n\n";

  ltak(); print $c[12]."  TARAMA TEYITATI: \n".$c[10]
  ."   atscan -t <target | targets.txt> [--status <code> | --valid <string>] \n"
  ."   atscan -d <dork | dorks.txt> -l <level> --exp <payload> --status <code> | --valid <string> \n"
  ."   atscan -d <dorks.txt> -l <level> --replace <string> --with <string> --status <code> | --valid <string> \n"
  ."   atscan -d <dork | dorks.txt> -l <level> [--admin | --sql ..] --status <code> | --valid <string> \n"
  ."   atscan -d <dorks.txt> -l <level> --replace <string> --with <string> --status <code> | --valid <string>\n"
  ."   atscan -d <dorks.txt> -l <level> --replace <string> --with <string> --full --status <code> | --valid <string>\n"
  ."   atscan -d <dorks.txt> -l <level> --replace <string> --with <string> --exp <payload> --status <code> | --valid <string>\n"
  ."   atscan --data \"name:userfile[DATAFILE]value:file.txt\" --post -v <string> | --status <code> \n"
  ."   atscan -d <dork | dorks.txt> -l <level> [--sql | --shost ..] --status <code> | --valid <string> \n\n";

  ltak(); print $c[12]."  GUNCELLEME ARACI: \n".$c[10]."   --update\n";

  ltak(); print $c[12]."  KALDIRMA ARACI: \n".$c[10]."   atscan --uninstall\n";
  ltak(); ltak();

1;
