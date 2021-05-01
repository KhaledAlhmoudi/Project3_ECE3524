#!/bin/bash

while true
do #loop the menu over and over until the user exits
  date; #date and menu setup
  echo "-----------------------------------"
  echo " Main Menu"
  echo "-----------------------------------"
  echo "1. Operating system info"
  echo "2. Hostname and DNS info"
  echo "3. Network info"
  echo "4. Who is online"
  echo "5. Last logged in users"
  echo "6. My IP address"
  echo "7. My disk usage"
  echo "8. My home file-tree"
  echo "9. Process operations"
  echo "10. Exit"
  echo -n "Enter your choice [ 1-10 ] "
  read option  #case structure for all options
  case "$option" in
   1)echo "---------------------------"
     echo " System information"
     echo "---------------------------"
     lsb_release -a; ;;
   2) echo "---------------------------"
      echo " Hostname and DNS info"
      echo "---------------------------"
      echo -n "Hostname : "; hostname; 
      echo -n "DNS domain : "; domainname;
      echo -n "Fully qualified domain name : "; hostname --fqdn;
      echo -n "Network address (IP) : "; hostname -I | awk '{print $1}';
      echo -n "DNS name servers (DNS IP) : "; grep "nameserver" /etc/resolv.conf ;;
   3) echo "--------------------------------------------------------------------"
      echo " Network information "     
      echo "--------------------------------------------------------------------"
      echo -n "Total network interfaces found : "; ip -o link show | wc -l;
      echo "*** IP Addresses Information ***"
      ip a;
      echo "***********************"
      echo "*** Network routing ***"
      echo "***********************"
      netstat -r;
      echo "*************************************"
      echo "*** Interface traffic information ***"
      echo "*************************************"
      netstat -i; ;;
   4)echo "-------------------------------"
     echo " Who is online"
     echo "-------------------------------"
	   who -H ;;
   5)echo "-----------------------------------"
     echo " List of last logged in users " 
     echo "-----------------------------------"
     last ;;
   6)echo "--------------------------------------"
     echo " Public IP information "
     echo "--------------------------------------"
     dig +short myip.opendns.com @resolver1.opendns.com;
     ;;
   7)echo "----------------------------------------------"
     echo " Disk Usage Info "
     echo "----------------------------------------------"
     df --output=pcent,target | sed -n '1!p' | sort -n; ;;
   8) echo "--------------------------------"
      echo " My home file-tree"
      echo "--------------------------------"
      echo " File has been generated"
      sh ./proj1.sh  ;;
   9) sh ./proc.sh;;
   10) exit;;
   q) exit ;;
  esac
  echo -n "Press [Enter] key to continue..."
  read cont
  
done
