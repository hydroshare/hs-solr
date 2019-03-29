FROM solr:6.6

WORKDIR /opt/solr

USER solr

RUN chown -R solr:solr /opt/solr
RUN ["mkdir", "/opt/solr/server/solr/collection1"]
RUN ["mkdir", "/opt/solr/server/solr/collection1/conf"]
RUN ["mkdir", "/opt/solr/server/solr/index"]

RUN rm -f /opt/solr/server/solr/configsets/basic_configs/conf/managed-schema

ADD core.properties /opt/solr/server/solr/collection1/core.properties
ADD schema.xml /opt/solr/server/solr/configsets/basic_configs/conf/schema.xml
ADD solrconfig.xml /opt/solr/server/solr/collection1/conf/solrconfig.xml

VOLUME ["/opt/solr/server/solr/collection1"] 

#ENTRYPOINT ["docker-entrypoint.sh"]
#CMD ["solr-foreground"]
