# if (Gem.win_platform?)
#   Encoding.default_external = Encoding.find(Encoding.locale_charmap)
#   Encoding.default_internal = __ENCODING__
#
#   [STDIN, STDOUT].each do |io|
#     io.set_encoding(Encoding.default_external, Encoding.default_internal)
#   end
# end

require_relative "lib/film.rb"
files_dir = __dir__ + "/films"
films = Dir[files_dir + "/*.txt"]

directors = []
films_info = []

films.each do |file_path|
  films_info << Film.from_path(file_path)
end

films_info.each do |film|
  directors << film.director.chomp
end
uniq_directors = directors.uniq

puts "Программа \"Фильм на вечер\"\n\r"

uniq_directors.each_with_index do |film, index|
  puts "#{index + 1}: #{film}"
end
puts "Фильм какого режиссера вы хотите сегодня посмотреть?"

user_choice = 0

while user_choice == 0 do
  user_choice = gets.to_i
end

puts "\nИ сегодня вечером рекомендую посмотреть:"
director_name = uniq_directors[user_choice - 1]
chosen_film = films_info.select{|film| film.director.chomp == director_name}.sample

puts chosen_film
