require 'capistrano'

module Capushka
  
end

Capistrano.plugin :capushka, Capushka

configuration = Capistrano::Configuration.respond_to?(:instance) ?
  Capistrano::Configuration.instance(:must_exist) :
  Capistrano.configuration(:must_exist)

configuration.load do
  def babushka(task, options = {})
    puts task
  end
end