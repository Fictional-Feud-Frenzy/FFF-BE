require 'rails_helper'

RSpec.describe Character, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :intelligence }
    it { should validate_presence_of :strength }
    it { should validate_presence_of :speed }
    it { should validate_presence_of :durability }
    it { should validate_presence_of :power }
    it { should validate_presence_of :combat }
  end

  describe 'can determine if powerstats are null' do
    it 'returns true if any powerstat is null' do
      data = { 'powerstats' => { 'intelligence' => 'null',
                                  'strength' => 'null',
                                  'speed' => 'null',
                                  'durability' => 'null',
                                  'power' => 'null',
                                  'combat' => 'null' } }
      character = Character.new
      expect(character.powerstats_null(data)).to eq(true)
    end

    it 'returns true if any powerstat is empty' do
      data = { 'powerstats' => { 'intelligence' => '',
                                  'strength' => '',
                                  'speed' => '',
                                  'durability' => '',
                                  'power' => '',
                                  'combat' => '' } }
      character = Character.new
      expect(character.powerstats_null(data)).to eq(true)
    end

    it 'returns false if no powerstats are null' do
      data = { 'powerstats' => { 'intelligence' => 75,
                                  'strength' => 60,
                                  'speed' => 50,
                                  'durability' => 30,
                                  'power' => 99,
                                  'combat' => 35 } }
      character = Character.new
      expect(character.powerstats_null(data)).to eq(false)
    end

    it 'returns false if one powerstat is null' do
      data = { 'powerstats' => { 'intelligence' => 75,
                                  'strength' => 60,
                                  'speed' => 'null',
                                  'durability' => 30,
                                  'power' => 99,
                                  'combat' => 'null' } }
      character = Character.new
      expect(character.powerstats_null(data)).to eq(true)
    end

    it 'returns false if one powerstat is empty' do
      data = { 'powerstats' => { 'intelligence' => 75,
                                  'strength' => 60,
                                  'speed' => '',
                                  'durability' => 30,
                                  'power' => 99,
                                  'combat' => 55 } }
      character = Character.new
      expect(character.powerstats_null(data)).to eq(true)
    end
  end

  describe 'can calculate weighted average' do
    it 'returns the weighted average' do
      data = { 'powerstats' => { 'intelligence' => 75,
                                  'strength' => 60,
                                  'speed' => 50,
                                  'durability' => 30,
                                  'power' => 99,
                                  'combat' => 35 } }
      character = Character.new
      expect(character.calculate_weighted_average(data)).to eq(54)
    end

    it 'returns the weighted average' do
      data = { 'powerstats' => { 'intelligence' => 100,
                                  'strength' => 20,
                                  'speed' => 100,
                                  'durability' => 5,
                                  'power' => 100,
                                  'combat' => 95 } }
      character = Character.new
      expect(character.calculate_weighted_average(data)).to eq(68)
    end
  end
end