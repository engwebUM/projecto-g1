require 'rails_helper'

describe Plan do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:plan)).to be_valid
  end

  describe 'is invalid' do
    context 'without' do
      it 'name' do
        expect(FactoryGirl.build_stubbed(:plan, name: nil)).to be_invalid
      end

      it 'slots' do
        expect(FactoryGirl.build_stubbed(:plan, slots: nil)).to be_invalid
      end

      it 'price' do
        expect(FactoryGirl.build_stubbed(:plan, price: nil)).to be_invalid
      end

      it 'tickets' do
        expect(FactoryGirl.build_stubbed(:plan, tickets: nil)).to be_invalid
      end

      it 'discount_coupon' do
        expect(FactoryGirl.build_stubbed(:plan, discount_coupon: nil)).to be_invalid
      end

      it 'discount_tickets' do
        expect(FactoryGirl.build_stubbed(:plan, discount_tickets: nil)).to be_invalid
      end

      it 'description' do
        expect(FactoryGirl.build_stubbed(:plan, description: nil)).to be_invalid
      end
    end

    context 'with zero' do
      it 'slots' do
        expect(FactoryGirl.build_stubbed(:plan, slots: 0)).to be_invalid
      end
    end

    context 'with negative' do
      it 'slots' do
        expect(FactoryGirl.build_stubbed(:plan, slots: -1)).to be_invalid
      end

      it 'price' do
        expect(FactoryGirl.build_stubbed(:plan, price: -1)).to be_invalid
      end

      it 'tickets' do
        expect(FactoryGirl.build_stubbed(:plan, tickets: -1)).to be_invalid
      end

      it 'discount_coupon' do
        expect(FactoryGirl.build_stubbed(:plan, discount_coupon: -1)).to be_invalid
      end

      it 'discount_tickets' do
        expect(FactoryGirl.build_stubbed(:plan, discount_tickets: -1)).to be_invalid
      end
    end

    context 'with more than' do
      it '100% discount_coupon' do
        expect(FactoryGirl.build_stubbed(:plan, discount_coupon: 101)).to be_invalid
      end
    end
  end
end
