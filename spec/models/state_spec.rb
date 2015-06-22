require 'rails_helper'

describe State do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:state)).to be_valid
  end

  context 'is invalid' do
    context 'without' do
      it 'name' do
        expect(FactoryGirl.build_stubbed(:state, name: nil)).to be_invalid
      end

      it 'is_final' do
        expect(FactoryGirl.build_stubbed(:state, is_final: nil)).to be_invalid
      end
    end
  end
end
