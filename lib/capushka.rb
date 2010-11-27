require 'capistrano'

module Capushka
  def run(task, options)
    puts task
    p options
  end
end

Capistrano.plugin :capushka, Capushka

configuration = Capistrano::Configuration.respond_to?(:instance) ?
  Capistrano::Configuration.instance(:must_exist) :
  Capistrano.configuration(:must_exist)

configuration.load do
  def babushka(task, options = {})
    capushka.run(task, options)
  end
end