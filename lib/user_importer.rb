class UserImporter

  def initialize(filename=File.dirname(__FILE__) + "/../data/users.csv")
    @filename = filename
  end

  def import
    field_names = ['user_name', 'email', 'password',]

    print "Importing users from #{@filename}: "
    failure_count = 0

    User.transaction do
      File.open(@filename).each do |line|
        data = line.chomp.split(',')
        attribute_hash = Hash[field_names.zip(data)]
        begin
          student = User.create!(attribute_hash)
          print "."; STDOUT.flush
        rescue ActiveRecord::UnknownAttributeError
          print "!"; STDOUT.flush
          failure_count += 1
        end
      end
    end
    failures = "(failed to create #{failure_count} users)" if failure_count > 0
    puts "\nDONE #{failures}\n\n"
  end

end
