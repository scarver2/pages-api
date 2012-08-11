require 'spec_helper'

describe "Api::Pages" do
  describe "GET api/pages" do
    it "works!" do
      get api_pages_path
      response.status.should be(200)
    end
  end
end
