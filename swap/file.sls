/var/swapfile0:
  cmd.run:
    - name: |
        [ -f /var/swapfile0 ] || dd if=/dev/zero of=/var/swapfile0 bs=1M count={{ grains["mem_total"] }}
        chmod 0600 /var/swapfile0
        mkswap /var/swapfile0
        swapon -a
    - unless:
      - file /var/swapfile0 2>&1 | grep -q "Linux/i386 swap"
  mount.swap:
    - persist: true
