# -*- mode: ruby; encoding: UTF-8 -*-

require 'pp'
require 'rubygems'
begin
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError
  warn 'ATTENTION: Wirble is not loaded!'
end

if defined? Rails::Console
  require 'logger'
  logger = Logger.new(STDOUT)
  Rails.logger = logger
  # RAILS_DEFAULT_LOGGER = logger # old rails
  Hirb.enable if defined? Hirb
end

class IRB::WorkSpace
  def filter_backtrace_with_shoryaku(bt)
    filter_backtrace_without_shoryaku(bt) or return nil

    # みじかくする
    pathes = [
      ['LIB', $LOAD_PATH],
      ['GEM', ENV['GEM_PATH'].to_s.split(':')],
    ]
    pathes << ['RAILS', [RAILS_ROOT]] if defined? RAILS_ROOT

    pathes.each do |name, xs|
      xs.detect do |dir|
        bt.sub!(dir, name)
      end and break
    end
    bt
  end
  alias_method :filter_backtrace_without_shoryaku, :filter_backtrace
  alias_method :filter_backtrace, :filter_backtrace_with_shoryaku
end
