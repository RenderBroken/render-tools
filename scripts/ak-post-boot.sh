#!/system/bin/sh

[ ! -d "/data/data/akkernel" ] && mkdir /data/data/akkernel
chmod 755 /data/data/akkernel
sleep 5
#
# 1) color temperature setting
#
COLORTMP="/data/data/akkernel/colortemp"
COLORSF="/sys/devices/platform/mdp.458753/kcal"
[ -f $COLORTMP ] && echo `cat $COLORTMP` > $COLORSF
#
# 2) cpu voltage boost setting
#
VBOOSTTMP="/data/data/akkernel/voltageboost"
VBOOSTSF="/sys/module/acpuclock_krait/parameters/boost"
[ -f $VBOOSTTMP ] && echo `cat $VBOOSTTMP` > $VBOOSTSF
#
# 3) fast charge setting
#
FCHARGETMP="/data/data/akkernel/forcefastcharge"
FCHARGESF="/sys/kernel/fast_charge/force_fast_charge"
[ -f $FCHARGETMP ] && echo `cat $FCHARGETMP` > $FCHARGESF
#
# 4) file system sync setting
#
FSYNCTMP="/data/data/akkernel/fsyncenabled"
FSYNCSF="/sys/module/sync/parameters/fsync_enabled"
[ -f $FSYNCTMP ] && echo `cat $FSYNCTMP` > $FSYNCSF
#
# 5) touch sweep2wake setting
#
S2WTMP="/data/data/akkernel/sweep2wake"
S2WSF="/sys/android_touch/sweep2wake"
[ -f $S2WTMP ] && echo `cat $S2WTMP` > $S2WSF
#
# 6) short sweep2wake setting
#
S2WSHORTTMP="/data/data/akkernel/shortsweep"
S2WSHORTSF="/sys/android_touch/shortsweep"
[ -f $S2WSHORTTMP ] && echo `cat $S2WSHORTTMP` > $S2WSHORTSF
#
# 7) touch 2wake orientation setting
#
2WORIENTATIONTMP="/data/data/akkernel/orientation"
2WORIENTATIONSF="/sys/android_touch/orientation"
[ -f $2WORIENTATIONTMP ] && echo `cat $2WORIENTATIONTMP` > $2WORIENTATIONSF
#
# 8) touch doubletap2wake setting
#
DT2WTMP="/data/data/akkernel/doubletap2wake"
DT2WSF="/sys/android_touch/doubletap2wake"
[ -f $DT2WTMP ] && echo `cat $DT2WTMP` > $DT2WSF
#
# 9) touch 2wake power key setting
#
2WPKEYTMP="/data/data/akkernel/pwrkeysuspend"
2WPKEYSF="/sys/android_touch/pwrkey_suspend"
[ -f $2WPKEYTMP ] && echo `cat $2WPKEYTMP` > $2WPKEYSF
#
# 10) touch 2wake magnetic setting
#
2WMAGNETICTMP="/data/data/akkernel/lidsuspend"
2WMAGNETICSF="/sys/android_touch/lid_suspend"
[ -f $2WMAGNETICTMP ] && echo `cat $2WMAGNETICTMP` > $2WMAGNETICSF
#
# 11) global magnetic setting
#
GMAGNETICTMP="/data/data/akkernel/enablelid"
GMAGNETICSF="/sys/module/lid/parameters/enable_lid"
[ -f $GMAGNETICTMP ] && echo `cat $GMAGNETICTMP` > $GMAGNETICSF
