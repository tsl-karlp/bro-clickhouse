create table ssh (
day Date DEFAULT toDate(ts),
ts DateTime,
uid String,
orig_h String,
orig_p UInt16,
resp_h String,
resp_p UInt16,
status Enum8('failure'=0, 'success'=1, 'undetermined'=2),
direction Enum8(''=0, 'INBOUND'=1, 'OUTBOUND'=2),
client String,
server String,
resp_size Nullable(UInt16),
unknown1 Nullable(String),
unknown2 Nullable(String),
unknown3 Nullable(String),
unknown4 Nullable(String)
)
ENGINE = MergeTree(day,sipHash64(uid), (day,sipHash64(uid), uid), 8192);
