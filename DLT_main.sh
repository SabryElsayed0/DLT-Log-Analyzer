#!/usr/bin/bash

source DLT_Operations.sh
###################################  User Interface View #########################################
function DLT_Main_Menu () {
  
  while true; do
    echo "___________________________________________________________________________"
    echo "--------------------------  DLT Log Analyzer ------------------------------"
    echo "1. Display All Logs"
    echo "2. Filter By Log Level"
    echo "3. Display Error and Warning Summary"
    echo "4. Display Summarized Report"
    echo "5. Track Specific Event"
    echo "6. Exit"
    echo "_____________________________________________________________________________"
    echo "Select Your Choice"
    read -r choice
    echo "_____________________________________________________________________________"
    
    case $choice in
        1)
           DLT_Display_Logs "$1"
        ;;
        2) 
           DLT_Filter_Logs_By_Log_Level "$1"
        ;;
        3) 
           DLT_Display_Error_Warning_Summary "$1"
        ;;
        4)
           DLT_Display_Summerized_Report "$1"
        ;;
        5)
           DLT_Track_Specific_Event "$1"
        ;;
        6)
          
          echo "Exiting..."
          break
        ;;
	      *)
            echo "Invalid option. Please select again."
        ;;
    esac
done
}
#######################################################################################################

function main () {
  local FilePath=$1
  DLT_Main_Menu "$FilePath"
}


main "$1"





