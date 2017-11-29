FROM huangwx/snort3

COPY snort/snort.lua /opt/snort/etc/snort/snort.lua
COPY snort/rules/local.rules /opt/snort/etc/snort/rules/local.rules

CMD ["snort", "-c", "snort.lua", "-R", "rules/local.rules", "-i", "eth0:eth1", "-A", "alert_fast", "-k", "none", "--daq", "afpacket", "-Q"]