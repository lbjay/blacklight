module Blacklight::App
  module Controller
    autoload :Application, 'blacklight/app/controller/application'
    autoload :Catalog, 'blacklight/app/controller/catalog'
  end
  module App
    autoload :Application, 'blacklight/app/helper/application'
  end
end