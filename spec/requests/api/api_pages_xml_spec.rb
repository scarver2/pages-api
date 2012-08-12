require 'spec_helper'

describe "Api::Pages" do
  it "GET /api/pages" do
    get api_pages_path, :format => :xml
    response.should be_success
  end

  it "POST /api/pages" do
    post api_pages_path, page: { title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph }, :format => :xml
    response.should be_success
  end

  it "GET /api/pages/new" do
    get new_api_page_path, :format => :xml
    response.should be_success
  end

  it "GET /api/pages/edit" do
    page = FactoryGirl.create(:page)
    get edit_api_page_path(page), :format => :xml
    response.should be_success
  end

  it "GET /api/pages/published" do
    get published_api_pages_path, :format => :xml
    response.should be_success
  end

  it "GET /api/pages/unpublished" do
    get unpublished_api_pages_path, :format => :xml
    response.should be_success
  end

  it "POST /api/pages/:id/publish" do
    page = FactoryGirl.create(:page)
    post publish_api_page_path(page), :format => :xml
    response.should be_success
  end

  it "GET /api/pages/:id/total_words" do
    # NOTE: this treats compounded, hyphenated words as a single word e.g. well-formed == 1
    page = FactoryGirl.create(:page)
    get total_words_api_page_path(page), :format => :xml
    response.should be_success
    response.body.should == page.total_word_count.to_s
  end
end
