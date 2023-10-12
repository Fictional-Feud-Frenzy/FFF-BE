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
  end
end