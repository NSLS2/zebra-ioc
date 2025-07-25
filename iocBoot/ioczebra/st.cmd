#!../../bin/linux-x86_64/zebra

## You may have to change zebra to something else
## everywhere it appears in this file

< envPaths
< /epics/common/xf05idd-ioc1-netsetup.cmd

cd "$(TOP)"

epicsEnvSet("ENGINEER", "Jun Ma x3119")
epicsEnvSet("LOCATION", "XF:05IDD{RG:D3}")

## Register all support components
dbLoadDatabase("dbd/zebra.dbd",0,0)
zebra_registerRecordDeviceDriver(pdbbase) 

#drvAsynSerialPortConfigure("ty_zebra", "/dev/ttyUSB0", 100, 0, 0)
#asynSetOption("ty_zebra", 0, "baud", "115200")
#asynSetOption("ty_zebra", 0, "parity", "None")
#asynSetOption("ty_zebra", 0, "stop", "1")
#asynSetOption("ty_zebra", 0, "bits", "8")

#drvAsynIPPortConfigure("ty_zebra","xf05idd-tsrv3.nsls2.bnl.local:4014")
#drvAsynIPPortConfigure("ty_zebra","xf05idd-tsrv5.nsls2.bnl.local:4001")
drvAsynIPPortConfigure("ty_zebra","xf05idd-tsrv4.nsls2.bnl.local:4007")

#zebraConfig(Port, SerialPort, MaxPosCompPoints)
zebraConfig("ZEBRA", "ty_zebra", 100000)


## Load record instances
dbLoadTemplate 'db/zebra.substitutions'
dbLoadRecords("db/iocAdminSoft.db","IOC=XF:05IDD-CT{IOC:Zebra2}")

## autosave/restore machinery
# save_restoreSet_Debug(0)
# save_restoreSet_IncompleteSetsOk(1)
# save_restoreSet_DatedBackupFiles(1)

# set_savefile_path("${TOP}/as","/save")
# set_requestfile_path("${TOP}/as","/req")

# set_pass0_restoreFile("info_positions.sav")
# set_pass0_restoreFile("info_settings.sav")
# set_pass1_restoreFile("info_settings.sav")

iocInit()

## more autosave/restore machinery
# cd ${TOP}/as/req
# makeAutosaveFiles()
# create_monitor_set("info_positions.req", 5 , "")
# create_monitor_set("info_settings.req", 15 , "")

## Restore the configuration from file
dbpf("XF:05IDD-ES:1{Dev:Zebra2}:CONFIG_FILE", "/nsls2/data/srx/shared/config/equipment/zebra2/zebra2_latest")
dbpf("XF:05IDD-ES:1{Dev:Zebra2}:CONFIG_READ.PROC", 1)

# Restore encoder resolutions
dbpf("XF:05IDD-ES:1{Dev:Zebra2}:M1:MRES", -9.5368e-05)
dbpf("XF:05IDD-ES:1{Dev:Zebra2}:M2:MRES", 9.5368e-05)
dbpf("XF:05IDD-ES:1{Dev:Zebra2}:M3:MRES", 9.5368e-05)
dbpf("XF:05IDD-ES:1{Dev:Zebra2}:M4:MRES", 0)

dbpf("XF:05IDD-ES:1{Dev:Zebra2}:M1:SETPOS.PROC", 1)
dbpf("XF:05IDD-ES:1{Dev:Zebra2}:M2:SETPOS.PROC", 1)
dbpf("XF:05IDD-ES:1{Dev:Zebra2}:M3:SETPOS.PROC", 1)
dbpf("XF:05IDD-ES:1{Dev:Zebra2}:M4:SETPOS.PROC", 1)

cd ${TOP}
dbl > ./records.dbl
#system "cp ./records.dbl /cf-update/$HOSTNAME.$IOCNAME.dbl"
