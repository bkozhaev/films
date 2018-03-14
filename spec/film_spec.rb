require 'rspec'

require_relative '../lib/film.rb'

describe 'Film.rb' do
  before(:all) do
    @film = Film.from_path(__dir__ + "/fixtures/01.txt")
  end
  it 'return data from txt file ' do
    expect(@film.name).to eq('Список Шиндлера')
    expect(@film.director).to eq('Стивен Спилберг')
    expect(@film.year).to eq('1993')
  end

  describe 'to_s' do
    it 'returns the data from file in expected order' do
      expect(@film.to_s).to eq('Стивен Спилберг - Список Шиндлера (1993)')
    end
  end
end