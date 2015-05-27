class DbCleaner

  class << self

    def clean_db
      @bad_scenes = Story.scenes.where('content LIKE ? OR choice1_text LIKE ? OR choice2_text LIKE ?',
                                        '%<%>%', '%<%>%', '%<%>%')

    end

    private

    def sanitize

    end

  end
end