# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.authors       = ["Yi Wen"]
  gem.email         = ["ywen.github@gmail.com"]
  gem.description   = %q{To get github stats}
  gem.summary       = %q{To get github stats. see gh_repo_stats help for more details}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "gh_repo_stats"
  gem.require_paths = ["lib"]
  gem.version       = "0.0.1"
  gem.add_runtime_dependency(%q<thor>)
  gem.add_runtime_dependency(%q<octokit>)
  gem.add_development_dependency(%q<rspec>)
  gem.add_development_dependency(%q<rake>)
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'rb-fsevent'
  gem.add_development_dependency 'rb-readline'
  gem.add_development_dependency 'terminal-notifier-guard'
end
