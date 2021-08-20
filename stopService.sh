  
#!/bin/bash
service=monitors.service
systemctl -q is-active $service && sudo systemctl stop $service || exit 1
