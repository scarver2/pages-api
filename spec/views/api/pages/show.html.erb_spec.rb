=begin
require 'spec_helper'

describe "pages/show" do
  before(:each) do
    # @page = assign(:page, stub_model(Page,
    #   :title => "Title",
    #   :content => "MyText"
    # ))
    @page = FactoryGirl.build(:page)
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
  end
end
=end
