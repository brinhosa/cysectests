#!/bin/bash
#./ExecCyDefense.sh domain url
# TODO: 
echo $1 $2 $3 ' -> echo $1 $2 $3'
name=$(date +%Y%m%d)_$1
mkdir $name
cp big.txt $name/
cd $name
mkdir mirror
mkdir gobusteresults
mkdir .sqlmap
mkdir .sqlmap/tmp
mkdir sudomy_output
echo sublist_$name
echo ----WGET----
docker run --rm -v $(pwd)/sudomy_output:/usr/lib/sudomy/output --rm -v $(pwd)/sudomy.api:/usr/lib/sudomy/sudomy.api -it --rm screetsec/sudomy:v1.1.0 --all -d $2 --html
docker run --rm -v $(pwd):/data alpine wget --no-check-certificate -O /data/url_$1 $2
docker run --rm -v $(pwd):/data sequenceiq/alpine-dig dig $1 ANY >> dig_any_$1 &
docker run --rm -v $(pwd):/raster-output herzog31/rasterize $2 screenshot_link_$1.png 1980px*1080px 1.0

docker run -it -v $(pwd):/data --rm --shm-size=1024m --cap-add=SYS_ADMIN --entrypoint=/usr/bin/google-chrome-unstable yukinying/chrome-headless-browser --headless --disable-gpu --dump-dom https://pastebin.com/search?q=$1 >> chrome_paste_bin_1_$1.txt

docker run -it -v $(pwd):/data --rm --shm-size=1024m --cap-add=SYS_ADMIN --entrypoint=/usr/bin/google-chrome-unstable yukinying/chrome-headless-browser --headless --disable-gpu --dump-dom https://pastebin.com/search?q=$2 >> chrome_paste_bin_2_$1.txt

docker run -it -v $(pwd):/data --rm --shm-size=1024m --cap-add=SYS_ADMIN --entrypoint=/usr/bin/google-chrome-unstable yukinying/chrome-headless-browser --headless --disable-gpu --dump-dom http://data.alexa.com/data?cli=10&dat=snbamz&url="$2" >> chrome_alexa_2_$1.txt

docker run -it -v $(pwd):/data --rm --shm-size=1024m --cap-add=SYS_ADMIN --entrypoint=/usr/bin/google-chrome-unstable yukinying/chrome-headless-browser --headless --disable-gpu --dump-dom http://data.alexa.com/data?cli=10&dat=snbamz&url="$1" >> chrome_alexa_1_$1.txt

docker run -it -v $(pwd):/data --rm --shm-size=1024m --cap-add=SYS_ADMIN --entrypoint=/usr/bin/google-chrome-unstable yukinying/chrome-headless-browser --headless --disable-gpu --screenshot=/data/pastebin_1_$1.png https://pastebin.com/search?q=$1

docker run -it -v $(pwd):/data --rm --shm-size=1024m --cap-add=SYS_ADMIN --entrypoint=/usr/bin/google-chrome-unstable yukinying/chrome-headless-browser --headless --disable-gpu --screenshot=/data/virustotal_1_$1.png https://www.virustotal.com/gui/domain/$1/details

docker run -it -v $(pwd):/data --rm --shm-size=1024m --cap-add=SYS_ADMIN --entrypoint=/usr/bin/google-chrome-unstable yukinying/chrome-headless-browser --headless --disable-gpu --dump-dom https://www.virustotal.com/gui/domain/$1/relations >> chrome_virustotalrelations_1_$1.txt

docker run -it -v $(pwd):/data --rm --shm-size=1024m --cap-add=SYS_ADMIN --entrypoint=/usr/bin/google-chrome-unstable yukinying/chrome-headless-browser --headless --disable-gpu --dump-dom https://censys.io/domain/$1 >> chrome_censys.io_1_$1.txt


docker run --rm -v $(pwd):/data alpine wget --no-check-certificate -O /data/http_$1 http://$1
docker run --rm -v $(pwd):/data alpine wget --no-check-certificate -O /data/httpwww_$1 http://www.$1
docker run --rm -v $(pwd):/data alpine wget --no-check-certificate -O /data/httpswww_$1 https://www.$1
docker run --rm -v $(pwd):/data alpine wget --no-check-certificate -O /data/https_$1 https://$1
docker run --rm -v $(pwd):/data alpine wget --no-check-certificate -O /data/builtwith_$1 https://builtwith.com/$1
docker run --rm -v $(pwd):/data alpine wget --no-check-certificate -O /data/w3techs_$1 https://w3techs.com/sites/info/$1 
docker run --rm -v $(pwd):/data alpine wget --no-check-certificate -O /data/alexa_$1 "http://data.alexa.com/data?cli=10&dat=snbamz&url=$1"
docker run --rm -v $(pwd):/data alpine wget --no-check-certificate -O /data/alexa2_$1 "http://data.alexa.com/data?cli=10&dat=snbamz&url=$2"
docker run --rm -v $(pwd):/data alpine wget --no-check-certificate -O /data/virustotal_$1 https://www.virustotal.com/gui/domain/$1/details
docker run --rm -v $(pwd):/data alpine wget --no-check-certificate -O /data/virustotalisd_$1 http://cloud.infoseguranca.com.br/checkmalware.php?url=$1
docker run --rm -v $(pwd):/data alpine wget --no-check-certificate -O /data/virustotaliss_$1 http://cloud.infoseguranca.com.br/checkmalware.php?url=$2
docker run --rm -v $(pwd):/data alpine wget --no-check-certificate -O /data/pastebin_$1 https://pastebin.com/search?q=$1/details
docker run --rm -v $(pwd):/data alpine wget --no-check-certificate -O /data/socialmedia_$1 http://cdn.infoseguranca.com.br/show.php?email=a@$1

docker run --rm -v $(pwd):/data alpine wget --no-check-certificate -O /data/googlesafebrowsing_$1 https://transparencyreport.google.com/safe-browsing/search?url=$1

docker run --rm -v $(pwd):/data alpine wget --no-check-certificate -O /data/tech_$1 http://cloud.infoseguranca.com.br/tech.php?url=http://$2 &

docker run --rm -v $(pwd):/data alpine wget --no-check-certificate -O /data/certdaystoexpire_$1 http://cloud.infoseguranca.com.br/checkcert.php?url=$2

docker run --rm -v $(pwd):/data alpine wget -U "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36" --no-check-certificate -O /data/pastebin_$1 https://pastebin.com/search?q=$1/details
#docker run --rm -v $(pwd):/data alpine wget -U "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/77.0.3865.90 Safari/537.36" --no-check-certificate -O /data/pastebincse_$1  "https://cse.google.com/cse/element/v1?rsz=filtered_cse&num=100&hl=en&source=gcsc&gss=.com&cselibv=c96da2eab22f03d8&cx=013305635491195529773:0ufpuq-fpt0&q=$1&safe=off&cse_tok=AKaTTZh1RK9MG_nF_beiEbfT0lfx:1569429814861&sort=&exp=csqr,4229469&callback=google.search.cse.api2525"
echo ----PRINT----
docker run -it --rm -v $(pwd):/raster-output herzog31/rasterize https://pastebin.com/search?q=$1 pastebin_$1.png 1980px*1080px 1.0
echo ----MIRROR----
docker run --rm -v $(pwd):/data mwendler/wget wget --no-check-certificate -P /data/mirror/ --mirror --convert-links --page-requisites $2 &
docker run --rm -v $(pwd):/data alpine wget --no-check-certificate -O /data/emails_$1  http://cdn.infoseguranca.com.br/findnew/find.php?url=$1
echo ----ZAP OK----
docker run --memory=1g -v $(pwd):/zap/wrk/:rw -t owasp/zap2docker-stable zap-baseline.py -t $2 -g gen.conf -r zapreport_$1.html &
docker run --memory=1g -v $(pwd):/zap/wrk/:rw -t owasp/zap2docker-stable zap.sh  -Xmx4GB -quickurl $2 -quickout zapreport2_$1.html -cmd >> logzap.log.txt &

nmap -Pn -oA $1 $1 -T2 -p 80,443 --script 'vuln and not http-slowloris-check' $1 >>lognmap.log.txt &
	
echo ----SSLYZE----
docker run -v $(pwd):/root --rm -it phocean/sslyze --regular $1 --xml_out=/root/sslyze_$1.xml 
echo docker run -v $(pwd):/root --rm sslyze -it phocean/sslyze --regular $1 --xml_out=/root/sslyze_$1.xml 
echo ----NMAP OK----
nmap -T2 -sV -p 80,443 -Pn --script http-robots.txt,http-headers,http-server-header,http-title,http-security-headers,http-enum,http-sitemap-generator,http-favicon,ssl-cert,whois-domain,whois-ip,http-google-malware --script-args http-google-malware.api=AIzaSyAH81wvhXtWtaDxf0VZAsJMIwwum7K4T3A  --stylesheet ../nmap-bootstrap.xsl -oA $1 $1  &
echo ----SQLMAP1----
echo docker run --rm -it -v $(pwd):/root/.sqlmap/ paoloo/sqlmap --forms --crawl=5 --user-agent=Chromev12 --batch --answers="follow=Y,continue=Y,check=Y,crawling=Y,test=N,anti-CSRF=Y" --threads 10 --random-agent --output-dir="/root/.sqlmap/" --tmp-dir="/root/.sqlmap/tmp" -u $2 -v 1  

docker run --rm -it -v $(pwd):/root/.sqlmap/ paoloo/sqlmap --forms --crawl=5 --user-agent=Chromev12 --batch --answers="follow=Y,continue=Y,check=Y,crawling=Y,test=N,anti-CSRF=Y" --threads 10 --random-agent --output-dir="/root/.sqlmap/" --tmp-dir="/root/.sqlmap/tmp" -u $2 -v 1 & 
docker run --rm hypnza/sublist3r -d $1 >> sublist_$name &
docker run --rm -v $(pwd):/data -t "menzo/subbrute" $1 >> subbrute_$name &
docker run -v $(pwd):/data frapsoft/nikto -host $1 -output /data/nikto_$1.html &
docker run -v $(pwd):/var/www jradik/dirsearch-docker -u $1 --simple-report=/var/www/dirsearchoutput_$1.txt &

echo ----GOBUSTER OK----
docker run --rm -v $(pwd):/root/wordlists devalias/gobuster -w /root/wordlists/big.txt -u $2 -e -t 20 -o /root/wordlists/gobusteresults &
echo docker run --rm -v $(pwd):/root/wordlists devalias/gobuster -w /root/wordlists/big.txt -u testfire.net -e -t 20 -o /root/wordlists/gobusteresults &

echo docker run --rm -v ""$(pwd):/root/wordlists"" devalias/gobuster -w /root/wordlists/big.txt -u $2 -e -t 20 -o /root/wordlists/gobusteresults &

#https://github.com/Screetsec/Sudomy
echo ----SUDOMY----
#docker run -v "${PWD}/sudomy_output:/usr/lib/sudomy/output" -v "${PWD}/sudomy.api:/usr/lib/sudomy/sudomy.api" -it --rm screetsec/sudomy:v1.1.0 --all -d $2 --html

docker run -v $(pwd):/usr/lib/sudomy/output -it --rm screetsec/sudomy:v1.1.0 --all -d $1 --html
echo docker run -v $(pwd):/usr/lib/sudomy/output -it --rm screetsec/sudomy:v1.1.0 --all -d $1 --html
