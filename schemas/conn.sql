create table conn (
day Date DEFAULT toDate(ts),
ts DateTime,
uid String,
orig_h String,
orig_p UInt16,
resp_h String,
resp_p UInt16,
proto Enum8('icmp'=1, 'tcp'=6, 'udp'=17),
service Array(String),
duration Float32,
orig_bytes UInt64,
resp_bytes UInt64,
conn_state Enum8('OTH'=0, 'REJ'=1, 'RSTO'=2, 'RSTOS0'=3, 'RSTR'=4, 'RSTRH'=5, 'S0'=6, 'S1'=7, 'S2'=8, 'S3'=9, 'SF'=10, 'SH'=11, 'SHR'=12),
local_orig Enum8('F'=0, 'T'=1),
missed_bytes UInt64,
history String,
orig_pkts UInt64,
orig_ip_bytes UInt64,
resp_pkts UInt64,
resp_ip_bytes UInt64,
peer String
)
ENGINE = MergeTree(day,sipHash64(uid), (day,sipHash64(uid), uid), 8192);
