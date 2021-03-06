require './lib/infoboxer/version'

Gem::Specification.new do |s|
  s.name     = 'infoboxer'
  s.version  = Infoboxer::VERSION
  s.authors  = ['Victor Shepelev']
  s.email    = 'zverok.offline@gmail.com'
  s.homepage = 'https://github.com/molybdenum-99/infoboxer'

  s.summary = 'MediaWiki client and parser, targeting information extraction.'
  s.description = <<-EOF
    Infoboxer is library targeting use of Wikipedia (or any other
    MediaWiki-based wiki) as a rich powerful data source.
  EOF
  s.licenses = ['MIT']

  s.required_ruby_version = '>= 2.1.0'

  s.files = `git ls-files`.split($RS).reject do |file|
    file =~ /^(?:
    spec\/.*
    |Gemfile
    |Rakefile
    |\.rspec
    |\.gitignore
    |\.rubocop.yml
    |\.travis.yml
    )$/x
  end
  s.require_paths = ["lib"]
  s.bindir = 'bin'
  s.executables << 'infoboxer'

  s.add_dependency 'htmlentities'
  s.add_dependency 'mediawiktory', '>= 0.1.0'
  s.add_dependency 'addressable'
  s.add_dependency 'terminal-table'
end
