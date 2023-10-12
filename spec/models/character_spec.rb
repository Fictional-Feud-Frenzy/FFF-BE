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
    it { should validate_presence_of :image }
    it { should allow_value(nil).for(:full_name) }
    it { should allow_value(nil).for(:place_of_birth) }
    it { should allow_value(nil).for(:publisher) }
    it { should allow_value(nil).for(:alignment) }
    it { should allow_value(nil).for(:gender) }
    it { should allow_value(nil).for(:race) }
    it { should allow_value(nil).for(:height) }
    it { should allow_value(nil).for(:weight) }
    it { should allow_value(nil).for(:eye_color) }
    it { should allow_value(nil).for(:hair_color) }
    it { should allow_value(nil).for(:group_affiliation) }
  end
end