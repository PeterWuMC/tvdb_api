$:.push File.expand_path("../lib", __FILE__)
require 'tvdb_api/version'

Gem::Specification.new do |gem|
  gem.authors       = ['Peter Wu']
  gem.email         = ['peter.wu@simplybusiness.com']
  gem.description   = %q{TVDB API}
  gem.summary       = %q{TVDB API}
  gem.homepage      = %q{https://github.com/PeterWuMC/tvdb_api}

  gem.files         = `git ls-files`.split($\)
  gem.name          = 'TvdbApi'
  gem.require_paths = ['lib']
  gem.version       = TvdbApi::VERSION
  gem.license       = 'MIT'

  gem.add_runtime_dependency('httparty')
end
