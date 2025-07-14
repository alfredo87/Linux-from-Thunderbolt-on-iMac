 #!/bin/sh
        PREREQ=""
        prereqs() { echo "$PREREQ"; }
        case $1 in
        prereqs) prereqs; exit 0;;
        esac
        . /scripts/functions
        log_begin_msg "Authorizing Thunderbolt devices"
        for device in /sys/bus/thunderbolt/devices/*; do
            if [ -f "$device/authorized" ]; then
                echo 1 > "$device/authorized"
                log_success_msg "Authorized $device"
            fi
        done
        log_end_msg
