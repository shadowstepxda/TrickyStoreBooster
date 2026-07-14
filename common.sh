# Packages to always include in target.txt, regardless of DenyList/Exclude List.
# Add/remove packages as needed.
FIXED_PACKAGES="com.android.vending com.google.android.gms io.github.vvb2060.keyattestation"

# Detect root manager
[ "$APATCH" = "true" ] && MANAGER="APatch"
[ "$MANAGER" != "APatch" ] && [ "$MAGISK_VER_CODE" ] && MANAGER="Magisk"

# Regenerate target.txt
sync_target_list () {
	case "$MANAGER" in
		Magisk)
			su -c "{ magisk --denylist ls | cut -d'|' -f1; printf '%s\n' $FIXED_PACKAGES; } | sort -u > /data/adb/tricky_store/target.txt"
			;;
		APatch)
			su -c "{ awk -F, 'NR>1 && \$2==1 {print \$1}' /data/adb/ap/package_config; printf '%s\n' $FIXED_PACKAGES; } | sort -u > /data/adb/tricky_store/target.txt"
			;;
	esac
}
