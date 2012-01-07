require 'spec_helper'

describe Role do
  let :admin do
    Role.new name: "admin"
  end

  let :user do
    Role.new name: "user"
  end

  context "given an admin role" do
    subject do
      admin
    end
    context "#admin?" do
      it "should be true" do
        subject.admin?.should be_true
      end
    end
    context "#user?" do
      it "should be false" do
        subject.user?.should be_false
      end
    end
  end

  context "given a user role" do
    subject do
      user
    end
    context "#admin?" do
      it "should be true" do
        subject.admin?.should be_false
      end
    end
    context "#user?" do
      it "should be false" do
        subject.user?.should be_true
      end
    end
  end

  context "validations" do
    it "should not have duplicate roles name" do
      Role.create!(name: "role_name")
      lambda {Role.create!(name: "role_name")}.should raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
