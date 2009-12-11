#
# SolrDocument is a standard class that has the following behaviors/features:
#   - proxy for solr hash documents (method missing calls are forwarded to the source hash):
#       doc[:id]
#   - class based finders that return SolrDocument instances
#       SolrDocument.find(:q=>'*:*).docs.first.class == SolrDocument
#   - after_initialize class method for easy extensions, using standard Ruby
# 
# If you'd like to customize your solr documents, the first thing you'll need to do is create a file here:
#   app/models/solr_document.rb
# If you want a clean slate, add this to the file:
# class SolrDocument
#   include Blacklight::Solr::Document
# end
# You can then add your after_initialize calls and mixin modules.
# If you'd like to keep the default after_initialize settings, add this line before your class definition:
# require_dependency 'vendor/plugins/blacklight/app/models/solr_document.rb'
# You'll then "import" the after_initialize blocks from the default SolrDocument.
class SolrDocument
  
  include Blacklight::Solr::Document
  
  after_initialize do
    if self[:marc_display]
      extend Blacklight::Solr::Document::Marc
      self.marc_source_field = :marc_display
      self.marc_format_type = :marc21
    end
  end
  
  # could add a name to the bock, then provide the ability to remove individual named blocks?
  #after_initialize :open_url do
    # 
  #end
  # remove_after_initialize_block! :open_url
  
end