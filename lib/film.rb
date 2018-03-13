class Film
  attr_reader :director, :name, :year

  def initialize(name, director, year)
    @name = name.chomp
    @director = director.chomp
    @year = year.chomp
  end

  def self.from_path(file_path)
    name, director, year = File.new(file_path,"r:UTF-8").readlines
    new(name, director, year)
  end

  def to_s
    "#{@director} - #{@name} (#{@year})"
  end
end
