class Genre
    extend Concerns::Findable

    attr_accessor :name
    @@all = []

    def initialize(name, songs = nil)
        @name = name
        @songs = []
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

        def save
        @@all << self
    end

    def self.create(name)
        genre =  Genre.new(name)
        genre.save
        genre
    end

    def songs
        @songs
    end

    def add_song(obj)
        self.songs << obj if self.songs.detect {|song| song == obj}.nil?
    end

    def artists
        self.songs.collect {|song| song.artist}.uniq
    end

end