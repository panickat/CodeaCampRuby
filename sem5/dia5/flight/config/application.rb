require 'active_record'
require 'sqlite3'
require 'yaml'
require 'command_line_reporter'
require_relative '../app/models/model'
require_relative '../app/controllers/controller'
require_relative '../app/views/view'

configuration = YAML::load_file(File.join(__dir__, 'database.yml'))
ActiveRecord::Base.establish_connection(configuration['development'])
