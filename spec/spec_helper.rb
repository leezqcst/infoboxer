# encoding: utf-8

require 'rspec/its'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.configure_rspec_metadata!
end

require 'coveralls'
Coveralls.wear!

# require 'byebug'

$:.unshift 'lib'

require 'infoboxer'

# TODO: replace with saharspec/string_ext
def unindent(text)
  lines = text.split("\n")
  lines.shift while lines.first =~ /^\s*$/ && !lines.empty?
  lines.pop while lines.last =~ /^\s*$/ && !lines.empty?
  min_indent = lines.reject{|ln| ln =~ /^\s*$/}.
    map{|ln| ln.scan(/^\s*/)}.flatten.map(&:length).min
  lines.map{|ln| ln.sub(/^\s{#{min_indent}}/, '')}.join("\n")
end

require 'saharspec/its_map'
require 'saharspec/its_call'

module WebMock
  class Util::HashCounter
    def ordered_keys
      @order.to_a.sort_by(&:last).map(&:first)
    end
  end

  def WebMock.requests
    RequestRegistry.instance.requested_signatures.ordered_keys
  end

  def WebMock.last_request
    requests.last
  end
end
