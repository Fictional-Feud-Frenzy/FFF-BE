require 'rails_helper'

RSpec.describe Battle, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:character1) }
    it { should validate_presence_of(:character2) }
    it { should validate_presence_of(:winner) }
    it { should validate_presence_of(:description) }
  end

  describe 'relations' do
    it { should belong_to(:character1).class_name('Character').with_foreign_key('character1_id') }
    it { should belong_to(:character2).class_name('Character').with_foreign_key('character2_id') }
    it { should belong_to(:winner).class_name('Character').with_foreign_key('winner_id') }
  end
end
