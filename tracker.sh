#!/bin/bash
while : 
  do
  curl=`curl -s 'https://coinboard.me/home/' -H 'accept-encoding: gzip, deflate, br' -H 'accept-language: ja,zh-CN;q=0.9,zh;q=0.8,en;q=0.7,zh-TW;q=0.6' -H 'upgrade-insecure-requests: 1' -H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Safari/537.36' -H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8' -H 'referer: https://coinboard.me/home/' -H 'authority: coinboard.me' -H 'cookie: csrftoken=2xDry6vWxKzmTgeG9vcjmr0A5cbe2yqMcRAcyjXTEPOB0vncStNE2NOeEhO9cgUY; sessionid=zbzjfq7u5dnswv76kmx1wzn6gyxvfmct; _ga=GA1.2.1205159870.1512523927; _gid=GA1.2.1562426432.1513559585' --compressed | tr "<" "\n" | grep totalAsset_amount | sed 's/.*>//'`
  echo -ne "\n"$curl"\r"
  sleep 90;
done