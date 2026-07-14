MODDIR=${0%/*}
. "$MODDIR/common.sh"

# Wait for the device to be unlocked
while [ "$(/system/bin/app_process -Djava.class.path=$MODDIR/isKeyguardLocked.dex /system/bin com.rosan.shell.ActiviteJava)" == "true" ];
do
	sleep 2
done

sleep 10

# Regenerate target.txt immediately post boot, then every 12 hours
function sync_target_list_loop () {
	while true ; do
		sync_target_list
		sleep 43200
	done
}
sync_target_list_loop &
