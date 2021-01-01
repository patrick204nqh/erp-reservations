$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "erp/reservations/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "erp_reservations"
  s.version     = Erp::Reservations::VERSION
  s.authors     = ["Nguyen Quang Huy"]
  s.email       = ["patrick204nqh@gmail.com"]
  s.homepage    = "http://globalnaturesoft.com/"
  s.summary     = "Reservations features of Erp System."
  s.description = "Reservations features of Erp System."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails"
  s.add_dependency "erp_core"
  s.add_dependency "deface"
end
