xml.instruct! :xml, :version=>"1.0"
xml.rss(:version=>"2.0") {
        
  xml.channel {
          
    xml.title(t(:"catalog.index_title", :application => application_name))
    xml.link(formatted_catalog_index_url(:rss, params))
    xml.description(t(:"catalog.index_title", :application => application_name))
    xml.language('en-us')
    
    @response.docs.each do |doc|
      xml.item do
        xml.title( doc[:title_display])                              
        xml.link(catalog_url(doc[:id]))                                   
        xml.author( doc[:author_display] )                              
      end
    end
          
  }
}
