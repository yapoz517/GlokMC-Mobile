#!/usr/bin/env bash
# Kullanim: bash rebrand.sh <PojavLauncher-klasoru> <ikon.png>
# PojavLauncher'i GlokMC olarak yeniden markalar. (Test edilmedi: aşağıdaki yollar PojavLauncher v3_openjdk yapısına göre yazıldı.)
set -euo pipefail
SRC="${1:-PojavLauncher}"; ICON="$(realpath "${2:-assets/icon.png}")"
APP="$SRC/app_pojavlauncher"; RES="$APP/src/main/res"

# 1) Uygulama adi (tum dillerde)
for f in "$RES"/values*/strings.xml; do
  sed -i 's|<string name="app_name">[^<]*</string>|<string name="app_name">GlokMC</string>|' "$f"
  sed -i 's|<string name="app_short_name">[^<]*</string>|<string name="app_short_name">GlokMC</string>|' "$f"
done

# 2) Uygulama kimligi (istege bagli: CHANGE_APP_ID=1). Paket adi/kod klasoru DEGISMEZ, cunku native (JNI) kod ona bagli.
if [ "${CHANGE_APP_ID:-0}" = "1" ]; then
  sed -i 's|applicationId "net.kdt.pojavlaunch"|applicationId "me.glokmc.mobile"|' "$APP/build.gradle"
fi

# 3) Simge: tum yogunluklar + adaptive simgeyi kaldir
for d in mdpi:48 hdpi:72 xhdpi:96 xxhdpi:144 xxxhdpi:192; do
  dir="$RES/mipmap-${d%%:*}"; sz="${d##*:}"; mkdir -p "$dir"
  convert "$ICON" -resize ${sz}x${sz} "$dir/ic_launcher.png"
  cp "$dir/ic_launcher.png" "$dir/ic_launcher_round.png"
done
rm -f "$RES"/mipmap-anydpi*/ic_launcher*.xml

echo "Tamam: GlokMC markasi uygulandi."
