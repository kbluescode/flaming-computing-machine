class SceneImporter

  def initialize(filename=File.dirname(__FILE__) + "/../db/data/scenes.csv")
    @filename = filename
  end

  def import
    field_names = ['', '', '', '']

    print "Importing scenes from #{@filename}: "
    failure_count = 0

    Scene.transaction do
      File.open(@filename).each do |line|
        data = line.chomp.split(',')
        attribute_hash = Hash[field_names.zip(data)]
        begin
          student = Scene.create!(attribute_hash)
          print "."; STDOUT.flush
        rescue ActiveRecord::UnknownAttributeError
          print "!"; STDOUT.flush
          failure_count += 1
        end
      end
    end
    failures = "(failed to create #{failure_count} scenes)" if failure_count > 0
    puts "\nDONE #{failures}\n\n"
  end

end
