require 'spec_helper'

describe Page do
  it "has title" do
    page = FactoryGirl.create(:page)
    page.title
  end

  it "must have title" do
    page = FactoryGirl.create(:page)
    page.title = nil
    page.should_not be_valid
  end

  it "has content" do
    page = FactoryGirl.create(:page)
    page.content
  end

  it "returns total word count" do
    page = FactoryGirl.build(:page)
    page.title = "Hello"
    page.content = "World"
    page.total_word_count == 2
  end
  
  it "can publish" do
    page = FactoryGirl.build(:page)
    page.publish
  end

  it "can unpublish" do
    page = FactoryGirl.create(:page)
    page.publish
    page.unpublish
  end
end