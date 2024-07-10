#!/system/bin/sh

[ -z "$(magisk --path)" ] && alias magisk='ksu-magisk'

MAGISKTMP="$(magisk --path)/.magisk"

# Note: Don't use "${MAGISKTMP}/mirror/system/vendor/*" instaed of "${MAGISKTMP}/mirror/vendor/*".
# In some cases, the former may link to overlaied "/system/vendor" by Magisk itself (not mirrored original one).

# Replace audio policy file (default)
REPLACE="
/system/vendor/etc/audio_policy.conf
"

for i in $REPLACE; do
    if [ -r "$i" ]; then
        chmod 644 "${MODPATH}${i}"
        chcon u:object_r:vendor_configs_file:s0 "${MODPATH}${i}"
        chown root:root "${MODPATH}${i}"
    fi
done

# Replace audio policy configuration file (default)
REPLACE="
/system/vendor/etc/audio_policy_configuration.xml
"

for i in $REPLACE; do
    if [ -r "$i" ]; then
        chmod 644 "${MODPATH}${i}"
        chcon u:object_r:vendor_configs_file:s0 "${MODPATH}${i}"
        chown root:root "${MODPATH}${i}"
    fi
done
