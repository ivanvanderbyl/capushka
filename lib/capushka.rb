require 'capistrano'

module Capushka
  
  def bootstrap!
    cloud_adapter.execute(instance_name, %Q{bash -c "`wget -O- babushka.me/up/hard`"}, default_opts)
  end

  def babushka(taskname, vars = {})
    # # not used yet, but this makes sense. --defaults (or headless) is the default!
    # if vars == :no_defaults
    #   cloud_adapter.execute(instance_name, "babushka '#{taskname}'", default_opts)
    # else
    #   if !vars.empty?
    #     write_file(".babushka/vars/#{taskname}", {
    #       :vars => vars.map_keys(&:to_s).map_values { |v| {:value => v} }
    #     }.to_yaml)
    #   end
    #   cloud_adapter.execute(instance_name, "babushka '#{taskname}' --defaults", default_opts)
    # end
  end
  
  def write_vars(vars = {})
    if !vars.empty?
      write_file(".babushka/vars/#{taskname}", {
        :vars => vars.map_keys(&:to_s).map_values { |v| {:value => v} }
      }.to_yaml)
    end
  end
  
  def write_file(path, content, options = {})
    put(content, path, options)
  end
  
  private
  
  def default_opts
    {}
  end
  
end

Capistrano.plugin :capushka, Capushka

configuration = Capistrano::Configuration.respond_to?(:instance) ?
  Capistrano::Configuration.instance(:must_exist) :
  Capistrano.configuration(:must_exist)

configuration.load do
  def babushka(task, vars = {})
    capushka.babushka(task, vars)
  end
  
  def write_vars(vars = {})
    capushka.write_vars(vars)
  end
  
  task :bootstrap_babushka do
    capushka.bootstrap!
  end
end
