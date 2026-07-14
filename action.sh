MODDIR=${0%/*}
. "$MODDIR/common.sh"

echo "- Syncing target.txt from $MANAGER..."
sync_target_list
echo "- target.txt updated"
