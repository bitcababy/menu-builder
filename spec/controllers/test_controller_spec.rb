require 'spec_helper'

describe TestController do

  describe "GET 'dropdown'" do
    it "returns http success" do
      get 'menubar'
      response.should be_success
    end
  end

  describe "GET 'vertical'" do
    it "returns http success" do
      get 'vertical'
      response.should be_success
    end
  end

end
