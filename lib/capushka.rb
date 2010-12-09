require 'capistrano'

Dir.glob(File.dirname(__FILE__) + '/core_ext/*.rb') { |f| require f }

module Capushka
  
  def bootstrap!
    run %Q{bash -c "`wget -O- babushka.me/up/hard`"}
  end
  
  def babushka(task_name, vars = {})
    write_vars task_name, vars
    stdout = capture("babushka '#{task_name}' --defaults")#, :pty => false, :shell => 'bash'
    return stdout
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
