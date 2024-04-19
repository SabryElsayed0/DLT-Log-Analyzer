#!/usr/bin/bash

##################################################################################################
 # Author           :Sabry Elsayed
 # File description :DLT_Operations.sh
 # Date             :19/4/2024
 # Version          :v0.0
 ################################################################################################


######## File --------> INFo , ERROR , WARNING ,DEBUG, TimeStamp #####


################################### Display Logs Function #####################################

function DLT_Display_Logs () {
  local FilePath=$1

  echo "****************************** All Logs ******************************************"
  while IFS= read -r line; do
    echo "$line"
  done < "$FilePath"
  echo "***********************************************************************************"
  
  
}

################################### Display_Error_Logs #############################################
function DLT_Display_Error_Logs () {
  local FilePath=$1

  echo "****************************** Error Logs ******************************************"

    while IFS= read -r line; do
    if [[ "${line}" == *"ERROR"* ]]; then
      echo "${line}"
    fi
  done < "$FilePath"
  echo "*************************************************************************************"
  
}
############################### Display Warning Logs ##########################################

function DLT_Display_Warning_Logs () {
  local FilePath=$1
  echo "****************************** warning Logs ******************************************"
  
  while IFS= read -r line; do
    if [[ "${line}" == *"WARN"* ]]; then
      echo "${line}"
    fi
  done < "$FilePath"
  echo "**************************************************************************************"

}
################################################################################################


############################### Display Debug Logs ##########################################

function DLT_Display_Debug_Logs () {
  local FilePath=$1
  echo "****************************** Dubug Events ******************************************"

  while IFS= read -r line; do
    if [[ "${line}" == *"DEBUG"* ]]; then
      echo "${line}"
    fi
  done < "$FilePath"

  echo "***************************************************************************************"

}
################################################################################################

############################### Display Info Logs ##########################################

function DLT_Display_Info_Logs () {
  local FilePath=$1
  echo "****************************** All Info Events *****************************************"
  
  while IFS= read -r line; do
    if [[ "${line}" == *"INFO"* ]]; then
      echo "${line}"
    fi
  done < "$FilePath"
  echo "****************************************************************************************"

}
################################################################################################



############################### Filter_Logs_By_Log_Level ##########################################
function  DLT_Filter_Logs_By_Log_Level() 
{
  FilePath=$1
  echo "--------------------------------------------------------------------------"
  echo "Select Log Level "
  select Log_Level in "Display Error Logs" "Display Warning Logs" "Disblay Debug Logs"  "Display Info Logs" "Return to the main menu"; do
    case "${Log_Level}" in 
        "Display Error Logs")
           DLT_Display_Error_Logs "$1"
        ;;
        "Display Warning Logs")
           DLT_Display_Warning_Logs "$1"
        ;;
        "Disblay Debug Logs")
            DLT_Display_Debug_Logs  "$1"
        ;;
        "Display Info Logs")
            DLT_Display_Info_Logs   "$1"
        ;;
        "Return to the main menu")
          break
        ;;
        *)
          echo "Invalid option. Please select again."
        ;;
    esac
done
}
######################################################################################################

################################# Count Number Of Errors #############################################

function DLT_Count_NO_Of_Errors () {
  local FilePath=$1
  local -i No_Of_Errors=0
  while IFS= read -r line; do
    if [[ "${line}" == *"ERROR"* ]]; then
      No_Of_Errors=$(("$No_Of_Errors" + 1))
    fi
  done < "$FilePath"

  echo "$No_Of_Errors"

}
#######################################################################################################

################################## Count Number Of Warnings ###########################################
function DLT_Count_NO_Of_Warnings () {
  local FilePath=$1
  local -i No_Of_Warnings=0
  while IFS= read -r line; do
    if [[ "${line}" == *"WARN"* ]]; then
      No_Of_Warnings=$(("$No_Of_Warnings" + 1))
    fi
  done < "$FilePath"

  echo "$No_Of_Warnings"

}

#######################################################################################################


###################################### Count Number Of Debug ##########################################
function DLT_Count_NO_Of_Debug_Logs () {

  local FilePath=$1
  local -i No_Of_DEBUG_Logs=0
  while IFS= read -r line; do
    if [[ "${line}" == *"DEBUG"* ]]; then
      No_Of_DEBUG_Logs=$(("$No_Of_DEBUG_Logs" + 1))
    fi
  done < "$FilePath"

  echo "$No_Of_DEBUG_Logs"

}
#######################################################################################################

############################### Count Number Of Info Logs #############################################
function DLT_Count_NO_Of_Info_Logs () {

  local FilePath=$1
  local -i No_Of_Info_Logs=0
  while IFS= read -r line; do
    if [[ "${line}" == *"INFO"* ]]; then
      No_Of_Info_Logs=$(("$No_Of_Info_Logs" + 1))
    fi
  done < "$FilePath"

  echo "$No_Of_Info_Logs"

}

#######################################################################################################

###################################### Track Specific Events ##########################################

function DLT_Track_Specific_Event () {
  local FilePath=$1
  local -i No_Of_Info_Logs=0
  local Event_Name=""
  local -i IS_Exist=0
  echo "Enter the event to be tracked" 
  read  -r Event_Name
  echo "the event is $Event_Name"

  while IFS= read -r line; do
    if [[ "${line}" == *"$Event_Name"* ]]; then
      echo "${line}"
      IS_Exist=1
    fi
  done < "$FilePath"

  if ((! "$IS_Exist" == 1)); then
    echo "The $Event_Name is not found"
  fi
  
}

#######################################################################################################


function DLT_Display_Error_Warning_Summary () {
  local FilePath=$1
  local -i No_Of_Errors=0
  local -i No_Of_Warnings=0

  No_Of_Errors=`DLT_Count_NO_Of_Errors $FilePath`

  No_Of_Warnings=`DLT_Count_NO_Of_Warnings $FilePath`
  
  echo "****************** Error and Warnig Logs Summary ***********************"
  echo "                                                             "
  echo "Total Error Logs   : $No_Of_Errors Errors"
  echo "Total Warning Logs : $No_Of_Warnings Warnings"
  echo "                                                             "
  echo "************************************************************************"
}

#################################################################################################
function DLT_Display_Summerized_Report () {
  local FilePath=$1
  local -i No_Of_Errors=0
  local -i No_Of_Warnings=0
  local -i No_Of_Debug_Logs=0
  local -i No_Of_Info_Logs=0
  No_Of_Errors=`DLT_Count_NO_Of_Errors $FilePath`

  No_Of_Warnings=`DLT_Count_NO_Of_Warnings $FilePath`

  No_Of_Debug_Logs=`DLT_Count_NO_Of_Debug_Logs $FilePath`

  No_Of_Info_Logs=`DLT_Count_NO_Of_Info_Logs $FilePath`
  
  echo "*********************** Summerized Report  *****************************"
  echo "                                                             "
  echo "Total Error Logs   : $No_Of_Errors Errors"
  echo "Total Warning Logs : $No_Of_Warnings Warnings"
  echo "Total Debug Logs   : $No_Of_Debug_Logs Debug Events"
  echo "Total Info Logs    : $No_Of_Info_Logs Info Events"
  echo "                                                             "
  echo "************************************************************************"
}
