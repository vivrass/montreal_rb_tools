require 'spec_helper'

describe Talk do
  let :speaker do
    Factory.build(:user)
  end

  let :created_by_user do
    Factory.build(:admin)
  end

  let :talk_attributes do
    {
      title: "A title", 
      description: "The description", 
      speaker: speaker,
      created_by: created_by_user,
      updated_by: created_by_user,
    }
  end

  let :talk do
    Talk.create!(talk_attributes)
  end

  context "validation" do
    [:title, :description, :speaker, :created_by, :updated_by].each do |attribute|
      it "should not have #{attribute} empty" do
        lambda do
          Talk.create!( talk_attributes.reject{|a,v| a == attribute} )
        end.should raise_error(ActiveRecord::RecordInvalid, /#{attribute.to_s.humanize}/i)
      end
    end

    it "should be able to create valid talk" do
      count = Talk.count
      lambda {talk}.should_not raise_error
      Talk.count.should == count + 1
    end
  end

  context "associations" do
    it "should be able to access speaker information" do
      talk.speaker.should_not be_nil
      talk.speaker.name.should == speaker.name
    end

    it "should be able to access created_by information" do
      talk.created_by.should_not be_nil
      talk.created_by.name.should == created_by_user.name
    end

    it "should be able to access updated_by information" do
      talk.updated_by.should_not be_nil
      talk.updated_by.name.should == created_by_user.name
    end
  end
end
