# meant to be mixed into a SolrDocument (Hash/Mash based object)
module Blacklight::Solr::Document::Marc
  
  attr_accessor :marc_source_field
  attr_accessor :marc_format_type
  
  def marc
    @marc ||= (
      Blacklight::Marc::Document.new fetch(marc_source_field), marc_format_type
    ) if key?(marc_source_field)
  end
  
  def to_zotero format
    marc.to_zotero format
  end
  
  def to_ala
    marc.to_ala
  end
  
  def to_mla
    marc.to_mla
  end
  
  def to_xml
    marc.to_xml
  end
  
end