 #!/bin/sh
        PREREQ=""
        prereqs() { echo "$PREREQ"; }
        case $1 in
        prereqs) prereqs; exit 0;;
        esac
        . /scripts/functions
        echo "Authorizing Thunderbolt devices"  > /dev/console
        for device in /sys/bus/thunderbolt/devices/*; do
            if [ -f "$device/authorized" ]; then
                echo 1 > "$device/authorized"
                echo "Authorized $device"  >  /dev/console
            fi
        done
        echo  "Thunderbolt drive authorized $device"  >  /dev/console
