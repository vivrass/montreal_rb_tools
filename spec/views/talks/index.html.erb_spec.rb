require 'spec_helper'

describe "talks/index.html.erb" do
  before(:each) do
    assign(:talks, [
      stub_model(Talk),
      stub_model(Talk)
    ])
  end

  it "renders a list of talks" do
    render
  end
end
