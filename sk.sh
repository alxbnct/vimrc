#!/bin/sh

# Swap CapsLK & Esc

xmodmap - <<EOF
remove Lock = Caps_Lock
keycode 9 = Caps_Lock NoSymbol Caps_Lock
keycode 66 = Escape NoSymbol Escape
add Lock = Caps_Lock
EOF

echo "OK"
