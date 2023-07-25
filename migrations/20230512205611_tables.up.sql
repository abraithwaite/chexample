CREATE TABLE source_table (
	workspaceID String,
	message String
) ENGINE = MergeTree() ORDER BY tuple();

CREATE TABLE dest_table (
	workspaceID String,
	message String
) ENGINE = MergeTree() ORDER BY tuple();

CREATE MATERIALIZED VIEW src_to_dest_mv
TO dest_table
AS SELECT *
FROM source_table;
