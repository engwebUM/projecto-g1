require 'rails_helper'

describe User do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:user)).to be_valid
  end

  describe 'is invalid' do
    context 'without' do
      it 'first name' do
        expect(FactoryGirl.build_stubbed(:user, first_name: '')).to be_invalid
      end

      it 'last name' do
        expect(FactoryGirl.build_stubbed(:user, last_name: '')).to be_invalid
      end

      it 'email' do
        expect(FactoryGirl.build_stubbed(:user, email: nil)).to be_invalid
      end
    end

    context 'with repeated' do
      it 'email' do
        user = FactoryGirl.create(:user, email: 'repeated@email.com')
        expect(FactoryGirl.build_stubbed(:user, email: user.email)).to be_invalid
      end
    end
  end
end
