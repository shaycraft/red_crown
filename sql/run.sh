if [ $# != 1 ]; then
        echo "USAGE:  run.sh [load file]" 
        exit
fi

if [ ! -r $1 ]; then
        echo "File $1 not found."
        exit
fi


export PGUSER='postgres'
read -s -p "Enter db password for $PGUSER: " pgpass
export PGPASSWORD=$pgpass

createdb redcrown
psql -d redcrown -f setup_database.sql
psql -d redcrown -f create_tables.sql

psql -d redcrown -c "\copy leases(lease_id, state, county, township, tdir, range, rdir, section, qq, lessee, gross, net, leasenumber, leasedate, wellname) FROM '$1' WITH DELIMITER AS ',' CSV HEADER;"

shp2pgsql -s 4269 -c -g geom ../shp/qq.shp plss.qq | psql -d redcrown > /dev/null

psql -d redcrown -c "VACUUM ANALYZE leases";
psql -d redcrown -c "VACUUM ANALYZE plss.qq"

psql -d redcrown -f create_indexes.sql
psql -d redcrown -f grant_permissions.sql
