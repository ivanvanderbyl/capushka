require 'capistrano'

module Capushka
  
  def bootstrap!
    cloud_adapter.execute(instance_name, %Q{bash -c "`wget -O- babushka.me/up/hard`"}, default_opts)
  end

  def babushka(task_name, vars = {})
    write_vars task_name, vars
    # # not used yet, but this makes sense. --defaults (or headless) is the default!
    # if vars == :no_defaults
    #   cloud_adapter.execute(instance_name, "babushka '#{task_name}'", default_opts)
    # else
    #   if !vars.empty?
    #     write_file(".babushka/vars/#{task_name}", {
    #       :vars => vars.map_keys(&:to_s).map_values { |v| {:value => v} }
    #     }.to_yaml)
    #   end
    #   cloud_adapter.execute(instance_name, "babushka '#{task_name}' --defaults", default_opts)
    # end
  end
  
  def write_vars(task_name, vars = {})
    if vars.any?
      write_file(".babushka/vars/#{task_name}", {
        :vars => vars.map_keys(&:to_s).map_values { |v| {:value => v} }
      }.to_yaml)
    end
  end
  
  def write_file(path, content)
    put(content, path)
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
  
  task :bootstrap_babushka do
    capushka.bootstrap!
  end
end
