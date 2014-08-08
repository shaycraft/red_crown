CREATE TABLE leases (
    gid serial primary key,
    lease_id integer,
    state varchar(20),
    county varchar(255),
    township varchar(3),
    tdir varchar(1),
    range varchar(3),
    rdir varchar(1),
    meridian integer,
    section integer,
    qq varchar(4),
    lessee text,
    gross float,
    net float,
    leasenumber varchar(255),
    --leasedate date,
    leasedate varchar(255),
    wellname varchar(255)
)