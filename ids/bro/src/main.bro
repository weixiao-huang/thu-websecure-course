event NetControl::init() {
    local debug_plugin = NetControl::create_debug(T);
    NetControl::activate(debug_plugin, 0);
}

event tcp_packet (c: connection, is_orig: bool, flags: string, seq: count, ack: count, len: count, payload: string) {
    if (/jinzihao|mitmproxy/ in payload) {
#        local input2 = fmt("rst %s %s %s %s %s %s", c$id$resp_h, port_to_count(c$id$resp_p), ack, c$id$orig_h, port_to_count(c$id$orig_p), ack + len);
#        print fmt("tcp packet [from <%s:%s, %s> to <%s:%s, %s>]", c$id$orig_h, port_to_count(c$id$orig_p), seq, c$id$resp_h, port_to_count(c$id$resp_p), ack);
#        local result = Exec::run(Exec::Command($cmd="ls"));
        local seq_orig = get_orig_seq(c$id);
        local seq_resp = get_resp_seq(c$id);
#        print fmt("seq_origin: %s; seq: %s, ack: %s; seq_resp: %s; len: %s", seq_orig, seq, ack, seq_resp, len);
        local input1 = fmt("rst %s %s %s %s %s %s", c$id$orig_h, port_to_count(c$id$orig_p), seq_orig - len, c$id$resp_h, port_to_count(c$id$resp_p), seq_resp);
        print input1;
#        print input2;
    }
}
