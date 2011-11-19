require 'spec_helper'

describe LoadEnvironment do
  context "#load_keys_from_file" do
    let :key_file_fixture_path do
      "#{Rails.root}/spec/fixtures/key_file.sh"
    end

    it "should call #save_key for all good lines" do
      LoadEnvironment.should_receive(:save_key).with("VAR_1", "value_1")
      LoadEnvironment.should_receive(:save_key).with("VAR_2", "value_2")
      LoadEnvironment.should_receive(:save_key).with("VAR_3", "value_3")

      LoadEnvironment.load_keys_from_file(key_file_fixture_path)
    end
  end

  context "save_key" do
    it "should add it to ENV" do
      ENV["test_key"].should be_nil
      LoadEnvironment.save_key(:test_key, "test")
      ENV["test_key"].should == "test"

      # Clean our mess
      ENV.delete("test_key")
    end
  end
end

