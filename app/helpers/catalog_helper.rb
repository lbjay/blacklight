module CatalogHelper
  
  #
  	# shortcut for built-in Rails helper, "number_with_delimiter"
  	#
  	def format_num(num); number_with_delimiter(num) end

  	#
  	#
  	#
  	def page_entries_info(collection, options = {})
      start = collection.next_page == 2 ? 1 : collection.previous_page * collection.per_page + 1
      total_hits = @response.total
      start_num = format_num(start)
      end_num = format_num(start + collection.per_page - 1)
      total_num = format_num(total_hits)

      entry_name = options[:entry_name] ||
        (collection.empty?? 'entry' : collection.first.class.name.underscore.sub('_', ' '))

      if collection.total_pages < 2
        case collection.size
        when 0; I18n.t :"catalog.no_entries_found", :what => I18n.t(entry_name.to_sym, :count => total_num)
	when 1; I18n.t :"catalog.page_entries_info", :count => total_num, :start => start_num, :end => end_num, :what => I18n.t(("catalog." + entry_name).to_sym, :count => total_num)
	else; I18n.t :"catalog.page_entries_info", :count => total_num, :start => start_num, :end => end_num, :what => I18n.t(("catalog." + entry_name).to_sym, :count => total_num)
 # i18n ERROR // WAS:  "Displaying <b>all #{total_num}</b> #{entry_name.pluralize}"
        end
      else
	I18n.t :"catalog.page_entries_info", :count => total_num, :start => start_num, :end => end_num, :what => I18n.t(("catalog."entry_name).to_sym, :count => total_num)
      end
  end

  # Look up search field user-displayable label
  # based on params[:qt] and configuration.
  def search_field_label(params)
    h( Blacklight.label_for_search_field(params[:search_field]) )
  end

  # Export to Refworks URL, called in _show_tools
  def refworks_export_url(document = @document)
    "http://www.refworks.com/express/expressimport.asp?vendor=#{CGI.escape(application_name)}&filter=MARC%20Format&encoding=65001&url=#{CGI.escape(catalog_path(document[:id], :format => 'refworks_marc_txt', :only_path => false))}"        
  end
  
end
