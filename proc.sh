while true
do
  echo "(please enter the number of your selection below)"
  echo "1. Show all processes"
  echo "2. Kill a process"
  echo "3. Bring up top"
  echo "4. Return to Main Menu"
  read ch  
  case "$ch" in
   1)
     ps -ef;;
   2) 
     echo "Please enter the pid of the process you would like to kill:"
     read pid;
     kill -9 $pid;
     ;;
   3)
     top
     ;;
   4)
     exit;;
   q)
     exit;;
  esac
  echo -n "Press [Enter] key to continue..."
  read vont
done
