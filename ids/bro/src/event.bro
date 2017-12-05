event connection_established(c: connection) {
    print fmt("connection_establised");
}

event connection_finished(c: connection) {
    print fmt("connection_finished");
}

event connection_half_finished(c: connection) {
    print fmt("connection_half_finished");
}

event connection_rejected(c: connection) {
    print fmt("connection_rejected");
}

event connection_reset(c: connection) {
    print fmt("connection_reset");
}

