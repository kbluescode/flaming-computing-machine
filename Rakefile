require 'rake'
require "sinatra/activerecord/rake"

require_relative 'lib/scene_importer'
require_relative 'lib/user_importer'

require ::File.expand_path('../config/environment', __FILE__)

Rake::Task["db:create"].clear
Rake::Task["db:drop"].clear

# NOTE: Assumes SQLite3 DB
desc "create the database"
task "db:create" do
  touch 'db/db.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/db.sqlite3'
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc "populate the test database with sample data"
task "db:populate" do
  SceneImporter.new.import
  UserImporter.new.import
end