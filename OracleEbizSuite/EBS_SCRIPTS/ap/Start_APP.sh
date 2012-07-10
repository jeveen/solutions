Start_APP.sh

#!/usr/bin/ksh


# Start Apache and Forms Services


A_SCRIPTDIR="/oracle/clone/scripts"
A_APPSINFO="${A_SCRIPTDIR}/APPS_INFO"
A_HOST=`hostname`

A_SID=`grep sid ${A_SCRIPTDIR}/APPS_INFO | awk -F= '{print $2}'`
A_APHOST=`grep aphost ${A_SCRIPTDIR}/APPS_INFO | awk -F= '{print $2}'`
A_APPS=`grep apps ${A_SCRIPTDIR}/APPS_INFO | awk -F= '{print $2}'`

# Convert SID from upper case to lower case for application directories

L_SID=`expr $A_SID| tr '[A-Z]' '[a-z]'`
echo "Lower case of SID is ${L_SID}" | tee -a ${A_LOGFILE}


. /oracle/d1/applmgr/${A_SID}/${L_SID}appl/APPS${A_SID}_${A_APHOST}.env
$COMMON_TOP/admin/scripts/${A_SID}_${A_APHOST}/adstrtal.sh apps/${A_APPS}

