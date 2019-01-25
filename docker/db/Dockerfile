FROM postgres

ENV POSTGRES_USER user123
ENV POSTGRES_PASSWORD password123



ADD init/1_pg_dump_dktk_schema_and_view.sql /docker-entrypoint-initdb.d/1_pg_dump_dktk_schema_and_view.sql
ADD init/2_pg_dump_dktk_meta_data.sql /docker-entrypoint-initdb.d/2_pg_dump_dktk_meta_data.sql
ADD init/3_pg_dump_dktk_mds_data.sql /docker-entrypoint-initdb.d/3_pg_dump_dktk_mds_data.sql
ADD init/4_foreign_keys.sql /docker-entrypoint-initdb.d/4_foreign_keys.sql

#RUN    psql -d centralsearch -U user123  -a -f docker-entrypoint-initdb.d
#    && psql -d centralsearch -U user123  -a -f create-mds_k-view.sql
