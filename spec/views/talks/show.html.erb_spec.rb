require 'spec_helper'

describe "talks/show.html.erb" do
  before(:each) do
    @talk = assign(:talk, stub_model(Talk))
  end

  it "renders attributes in <p>" do
    render
  end
end
