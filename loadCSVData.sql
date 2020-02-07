--
-- Load the Astrolabe database catalog tables from CSV files.
--

\copy eazy from '/Users/hickst/UAZ/iSchool/data/JWST/JADES/catalogs/EAZY_results_summary.csv' DELIMITER ',' CSV HEADER;

\copy photometric from '/Users/hickst/UAZ/iSchool/data/JWST/JADES/catalogs/Photometric_Catalog.csv' DELIMITER ',' CSV HEADER;

\copy eazy200 from '/Users/hickst/UAZ/iSchool/data/JWST/DC_191217/catalogs/EAZY_results_summary_F200W_radec.csv' DELIMITER ',' CSV HEADER;

\copy eazy356 from '/Users/hickst/UAZ/iSchool/data/JWST/DC_191217/catalogs/EAZY_results_summary_F356W_radec.csv' DELIMITER ',' CSV HEADER;

\copy photometric200 from '/Users/hickst/UAZ/iSchool/data/JWST/DC_191217/catalogs/Photometric_Catalog.F200W_kron_f80.csv' DELIMITER ',' CSV HEADER;

\copy photometric356 from '/Users/hickst/UAZ/iSchool/data/JWST/DC_191217/catalogs/Photometric_Catalog.F356W_kron_f80.csv' DELIMITER ',' CSV HEADER;
