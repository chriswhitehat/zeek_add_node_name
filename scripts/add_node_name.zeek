##! Adds cluster node name to logs.

module NodeName;

# Add a field to the connection log record.
redef record Conn::Info += {
    ## Indicate if the originator of the connection is part of the
    ## "private" address space defined in RFC1918.
    node_name: string &optional &log;
};

event connection_state_remove(c: connection)
    {
    c$conn$node_name = Cluster::node;
    }

