require 'spec_helper'

describe Theater do

  [:name].each do |attr|
    it "should validate the presence of #{attr}" do
      theater = Theater.new
      theater.should_not be_valid
    end
  end

  it "should validate uniqueness of name" do
    theater = FactoryGirl.create(:theater)
    theater2 = Theater.create(:name => theater.name)

    theater2.should_not be_valid
    expect(theater2.errors.size).to be >= 1
  end

  context "Associations" do
    ["acts", "venues"].each do |attr|
      it "should be able to have #{attr}" do
        theater = FactoryGirl.build(:theater)
        theater.should respond_to(attr)
      end

      it "should return #{attr}" do
        theater = FactoryGirl.create(:theater)
        my_attr = FactoryGirl.build(attr.singularize, :theater => theater)
        theater.send(attr) << my_attr
        theater.send(attr).last.should be_a_kind_of(my_attr.class)
      end

      it "should delete all its acts if theater is deleted" do
        theater = FactoryGirl.create(:theater)
        3.times { FactoryGirl.create(attr.singularize, :theater => theater) }
        expect { theater.destroy }.to change(attr.singularize.camelcase.constantize, :count).from(3).to(0)
      end
    end
  end
end
