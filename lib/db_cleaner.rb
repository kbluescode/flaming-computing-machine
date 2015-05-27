class DbCleaner

  class << self

    def clean_db
      Scenes.all.to_a.each { |scene| scene.clean_html }
    end

  end
end
