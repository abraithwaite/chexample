CREATE ROLE role_customer;

CREATE ROW POLICY policy_source_customer ON default.source_table USING (workspaceID = '1') TO role_customer;
CREATE ROW POLICY policy_dest_customer ON default.dest_table USING (workspaceID = '1') TO role_customer;

GRANT SELECT ON default.source_table TO role_customer;
GRANT SELECT ON default.dest_table TO role_customer;

GRANT role_customer TO runreveal;

INSERT INTO default.source_table (workspaceID, message) VALUES ('1', 'customer1');

SELECT * FROM default.dest_table;
