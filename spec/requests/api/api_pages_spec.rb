require 'spec_helper'

describe "Api::Pages" do
  describe "GET /api/pages" do
    it "works" do
      get api_pages_path
      response.status.should be(200)
    end
  end

  describe "POST /api/pages" do
    it "works" do
      post api_pages_path
      response.status.should be(200)
    end
  end

  describe "GET /api/pages/new" do
    it "works" do
      get new_api_pages_path
      response.status.should be(200)
    end
  end

  describe "GET /api/pages/edit" do
    it "works" do
      get edit_api_pages_path
      response.status.should be(200)
    end
  end

  describe "GET /api/pages/published" do
    it "works" do
      get published_api_pages_path
      response.status.should be(200)
    end
  end

  describe "GET /api/pages/unpublished" do
    it "works" do
      get unpublished_api_pages_path
      response.status.should be(200)
    end
  end

  describe "POST /api/pages/unpublish" do
    it "works" do
      post published_api_page_path
      response.status.should be(200)
    end
  end

  describe "GET /api/pages/total_words" do
    it "works" do
      # NOTE: this treats compounded, hyphenated words as a single word e.g. well-formed == 1
      page = FactoryGirl.create(:page)
      get total_words_api_page_path
      response.status.should be(200)
      response.content.should page.title.split.size + page.content.split.size
    end
  end
end
