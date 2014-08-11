CREATE INDEX idx_qq ON leases(qq);
CREATE INDEX idx_leaseid ON leases(lease_id);
CREATE INDEX idx_qq_geom ON plss.qq USING GIST(geom);
