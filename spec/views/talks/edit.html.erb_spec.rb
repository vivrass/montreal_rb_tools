require 'spec_helper'

describe "talks/edit.html.erb" do
  before(:each) do
    @talk = assign(:talk, stub_model(Talk))
  end

  it "renders the edit talk form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => talks_path(@talk), :method => "post" do
    end
  end
end
