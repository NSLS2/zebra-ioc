TOP=../..
include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS AFTER THIS LINE

#----------------------------------------------------
#  Optimization of db files using dbst (DEFAULT: NO)
#DB_OPT = YES

#----------------------------------------------------
# In a Diamond Support Module, install
# templates like this
#
DB += zebraLastDivDiff.template
DB += zebra.template
DB += zebra.substitutions

#----------------------------------------------------
# In a Diamond IOC Application, build db files from
# template files like this
#
#DB += BL06I-MO-IOC-01.db
#DB += BL06I-MO-IOC-01_sim.db

#USES_TEMPLATE += $(MOTOR)/db/motor.template
#USES_TEMPLATE += $(MOTOR)/db/basic_motor.template

DB_INSTALLS += $(EPICS_BASE)/db/iocAdminSoft.db

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD RULES AFTER THIS LINE

# ../zebra.template: ../zebra.vdb
# 	$(RM) $@
# 	$(MAKE) install

