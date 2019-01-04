FROM postgres

ENV POSTGRES_USER user123
ENV POSTGRES_PASSWORD password123
ENV POSTGRES_DB centralsearch

#COPY a_create-schema.sql /
#COPY create-mds_k-view.sql /

ADD init/a_create-schema.sql /docker-entrypoint-initdb.d/a_create-schema.sql
#ADD create-mds_k-view.sql /docker-entrypoint-initdb.d/b_create-mds_k-view.sql
ADD init/c_dump.sql /docker-entrypoint-initdb.d/c_dump.sql
ADD init/d_foreign-keys.sql /docker-entrypoint-initdb.d/d_foreign-keys.sql


#RUN    psql -d centralsearch -U user123  -a -f docker-entrypoint-initdb.d
#    && psql -d centralsearch -U user123  -a -f create-mds_k-view.sql
