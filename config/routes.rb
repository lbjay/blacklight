ActionController::Routing::Routes.draw do |map|
  
  # to build Blacklight routes, pass the map object to the build method.
  # only build the routes if the plugin is running as the app.
  Blacklight::Routes.build(map) if Rails.root.to_s == Blacklight.root.to_s
  


  map.emails 'emails', :controller => 'catalog', :action => 'email'
  map.sms 'sms', :controller => 'catalog', :action => 'sms'
  map.citations_catalog 'citations', :controller => 'catalog', :action => 'citations'
  map.send_email_records 'send_email_records', :controller => 'catalog', :action => 'send_email_record'
  map.endnote 'endnote', :controller => 'catalog', :action => 'endnote'

  map.resources :folder, :only => [:index, :create, :destroy], :collection => {:clear => :delete }
end
