class StoryImporter

  def initialize(filename=File.dirname(__FILE__) + "/../data/stories.csv")
    @filename = filename
  end

  def import
    field_names = ['description', 'scene_id', 'total_upvotes']

    print "Importing stories from #{@filename}: "
    failure_count = 0

    Story.transaction do
      File.open(@filename).each do |line|
        data = line.chomp.split(',')
        attribute_hash = Hash[field_names.zip(data)]
        begin
          student = Story.create!(attribute_hash)
          print "."; STDOUT.flush
        rescue ActiveRecord::UnknownAttributeError
          print "!"; STDOUT.flush
          failure_count += 1
        end
      end
    end
    failures = "(failed to create #{failure_count} stories)" if failure_count > 0
    puts "\nDONE #{failures}\n\n"
  end

end
