class SolrDocument
  
  after_initialize do
    extend Blacklight::Solr::Document::Marc
    extend Blacklight::Solr::Document::EAD
  end
  
end