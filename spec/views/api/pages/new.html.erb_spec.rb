=begin
require 'spec_helper'

describe "pages/new" do
  # before(:each) do
  #   assign(:page, stub_model(Page,
  #     :title => "MyString",
  #     :content => "MyText"
  #   ).as_new_record)
  # end

  it "renders new page form" do
    render
    assert_select "form", :action => api_pages_path, :method => "post" do
      assert_select "input#page_title", :name => "page[title]"
      assert_select "textarea#page_content", :name => "page[content]"
    end
  end
end
=end
