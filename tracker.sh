#!/bin/bash
while : 
  do
  USN=`cat ~/.secrets/key.json | jq .Coinboard.username | sed 's/"//g'`
  PSW=`cat ~/.secrets/key.json | jq .Coinboard.password | sed 's/"//g'`
  AMOUNT=`php getForm.php $USN $PSW | tr "<" "\n" | grep sg-total-assets-amount | sed 's/.*>//'`
  echo -ne "\n"$AMOUNT"\r"
  sleep 90;
  done
