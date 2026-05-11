#!/bin/bash

# Dangerous capabilities to check
DANGEROUS_CAPS=(
    "cap_sys_admin"
    "cap_sys_module"
    "cap_sys_ptrace"
    "cap_sys_rawio"
    "cap_dac_override"
    "cap_dac_read_search"
)

echo "=== Checking for Dangerous Capabilities ==="
echo

# Capture capability output once and parse sets we care about.
CAPSH_OUTPUT=$(capsh --print)

# Example line: "Current: cap_chown,cap_dac_override,...=ep"
CURRENT=$(echo "$CAPSH_OUTPUT" | awk -F': ' '/^Current:/ {print $2}' | sed 's/=.*$//')
BOUNDING=$(echo "$CAPSH_OUTPUT" | awk -F'=|: ' '/^Bounding set/ {print $2}')
AMBIENT=$(echo "$CAPSH_OUTPUT" | awk -F'=|: ' '/^Ambient set/ {print $2}')

# Check each dangerous capability
FOUND=0
for cap in "${DANGEROUS_CAPS[@]}"; do
    IN_CURRENT=0
    IN_BOUNDING=0
    IN_AMBIENT=0

    if echo ",$CURRENT," | grep -qi ",$cap,"; then
        IN_CURRENT=1
    fi
    if echo ",$BOUNDING," | grep -qi ",$cap,"; then
        IN_BOUNDING=1
    fi
    if echo ",$AMBIENT," | grep -qi ",$cap,"; then
        IN_AMBIENT=1
    fi

    if [ $IN_CURRENT -eq 1 ] || [ $IN_BOUNDING -eq 1 ] || [ $IN_AMBIENT -eq 1 ]; then
        echo "⚠️  FOUND: $cap (current=$IN_CURRENT bounding=$IN_BOUNDING ambient=$IN_AMBIENT)"
        FOUND=1
    fi
done

if [ $FOUND -eq 0 ]; then
    echo "✅ None of the dangerous capabilities are present"
fi

echo
echo "=== Full Capability List ==="
echo "$CAPSH_OUTPUT"