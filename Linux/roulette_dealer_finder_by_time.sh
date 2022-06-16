#!/bin/bash

cat $1_Dealer_schedule | awk -F " " '{print $1, $2, $5,$6}'| grep "$2"

#To view the dealer for Blackjack on March 10 at 2:00 p.m., run:
sh roulette_dealer_finder_by_time.sh 0310 '02:00:00 PM' '$3' '$4'
#This will show: 02:00:00 PM Chyna Mercado
#To view the dealer for roulette on March 10 at 2:00 p.m., run:
sh roulette_dealer_finder_by_time.sh 0310 '02:00:00 PM' '$5' '$6'
#This will show: 02:00:00 PM Billy Jones
#To view the dealer for Texas Hold 'Em on March 10 at 2:00 p.m., run:
sh roulette_dealer_finder_by_time.sh 0310 '02:00:00 PM' '$7' '$8


#To view the dealer for Blackjack on March 10 at 2:00 p.m., run:
#sh roulette_dealer_finder_by_time_and_game.sh 0310 '02:00:00 PM' '$3' '$4'
#This will show: 02:00:00 PM Chyna Mercado
#To view the dealer for roulette on March 10 at 2:00 p.m., run:
#sh roulette_dealer_finder_by_time_and_game.sh 0310 '02:00:00 PM' '$5' '$6'
#This will show: 02:00:00 PM Billy Jones
#To view the dealer for Texas Hold 'Em on March 10 at 2:00 p.m., run:
#sh roulette_dealer_finder_by_time_and_game.sh 0310 '02:00:00 PM' '$7' '$8

