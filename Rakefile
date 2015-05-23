require 'rake'
require "sinatra/activerecord/rake"

require_relative 'lib/scene_importer'
require_relative 'lib/story_importer'
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

  # Make Users

  User.destroy_all
  kevin = User.create!(user_name: 'Kevin', password: 'derpderp')
  robin = User.create!(user_name: 'Robin', password: 'yodawg')
  andrew = User.create!(user_name: 'Andrew', password: 'iheartvince')

  # Make Scenes

  Scene.destroy_all
  scene1 = Scene.create!(content: 'A hobo walks up to you and asks for the time.',
                          choice1_text: 'You tell him the time.',
                          choice2_text: 'You give him a hug.')
  scene2 = Scene.create!(content: 'The hobo is grateful for the time and expresses his gratitude by peeing on your shoes.',
                          choice1_text: 'You just walk away.',
                          choice2_text: 'You punch him in the face.')

  scene1.scene1 = scene2
  scene1.save!

  # Make story

  Story.destroy_all
  story1 = Story.create!()

  story1.scenes << scene1
  story1.scenes << scene2
  # Add story to user
  
  kevin.stories << story1
  kevin.save!
end
