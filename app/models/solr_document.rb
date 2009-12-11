class SolrDocument
  
  include Blacklight::Solr::Document
  
  after_initialize do
    if self[:marc_display]
      extend Blacklight::Solr::Document::Marc
      self.marc_source_field = :marc_display
      self.marc_format_type = :marc21
    end
  end
  
end