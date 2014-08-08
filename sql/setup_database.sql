CREATE EXTENSION postgis;


GRANT ALL ON geometry_columns to GIS;
GRANT ALL ON spatial_ref_sys to GIS;

create schema plss;
GRANT ALL ON SCHEMA plss to GIS;
GRANT ALL ON SCHEMA public to GIS;