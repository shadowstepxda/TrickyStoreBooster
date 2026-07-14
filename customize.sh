# Only allow installation from Magisk/APatch apps.
if [ "$BOOTMODE" != "true" ]; then
  abort "! ERROR: Please install this module via Magisk/APatch app."
fi

# Only Magisk and APatch are supported.
if [ "$APATCH" != "true" ] && [ -z "$MAGISK_VER_CODE" ]; then
  abort "! ERROR: Only Magisk and APatch are supported."
fi
