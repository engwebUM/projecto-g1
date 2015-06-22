require 'rails_helper'

describe Sponsor do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:sponsor)).to be_valid
  end

  describe 'is invalid' do
    context 'without' do
      it 'organization' do
        expect(FactoryGirl.build_stubbed(:sponsor, organization: nil)).to be_invalid
      end

      it 'person_name' do
        expect(FactoryGirl.build_stubbed(:sponsor, person_name: nil)).to be_invalid
      end

      it 'person_email' do
        expect(FactoryGirl.build_stubbed(:sponsor, person_email: nil)).to be_invalid
      end
    end

    context 'with repeated' do
      it 'organization' do
        sponsor = FactoryGirl.create(:sponsor, organization: 'Not a random name')
        expect(FactoryGirl.build_stubbed(:sponsor, organization: sponsor.organization)).to be_invalid
      end
    end
  end
end
