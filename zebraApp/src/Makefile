TOP=../..

include $(TOP)/configure/CONFIG

# -------------------------------
# Build an Diamond Support Module
# -------------------------------

LIBRARY_IOC += zebra

# xxxRecord.h will be created from xxxRecord.dbd
#DBDINC += xxx.h

# xxxRecord.dbd will be installed into <top>/dbd
DBD += zebraSupport.dbd
DBD += zebra_vdct.dbd
zebra_vdct_DBD += base.dbd
zebra_vdct_DBD += asyn.dbd
zebra_vdct_DBD += asSupport.dbd
zebra_vdct_DBD += busySupport.dbd
zebra_vdct_DBD += motorRecord.dbd
zebra_vdct_DBD += motorSupport.dbd
zebra_vdct_DBD += devSoftMotor.dbd

# The following are compiled and added to the support library
zebra_SRCS += zebra.cpp
zebra_SRCS += ini.c

INCLUDE += zebraRegs.h

PROD_IOC = zebra
DBD += zebra.dbd
zebra_DBD += base.dbd
zebra_DBD += asyn.dbd
zebra_DBD += drvAsynSerialPort.dbd
zebra_DBD += drvAsynIPPort.dbd
zebra_DBD += motorSupport.dbd
zebra_DBD += devSoftMotor.dbd
zebra_DBD += asSupport.dbd
zebra_DBD += busySupport.dbd
zebra_DBD += zebraSupport.dbd
zebra_DBD += devIocStats.dbd
zebra_DBD += reccaster.dbd
zebra_SRCS += zebra_registerRecordDeviceDriver.cpp
#zebra_LIBS += zebra
zebra_LIBS += busy
zebra_LIBS += softMotor
zebra_LIBS += motor
zebra_LIBS += asyn
zebra_LIBS += autosave
zebra_LIBS += devIocStats
zebra_LIBS += reccaster
zebra_LIBS += $(EPICS_BASE_IOC_LIBS)
zebra_SRCS += zebraMain.cpp

# Link QSRV (pvAccess Server) if available
ifdef EPICS_QSRV_MAJOR_VERSION
    zebra_LIBS += qsrv
    zebra_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)
    zebra_DBD += PVAServerRegister.dbd
    zebra_DBD += qsrv.dbd
endif

DATA += zebra_sim.py

include $(TOP)/configure/RULES

