require 'spec_helper'

describe MainController do

  describe "GET 'index'" do
    it "returns http success" do
      get :index
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get :show, code: 'hoge'
      response.should be_success
    end
  end

  describe "GET 'search'" do
    it "returns http success" do
      get :search, code: 'hoge'
      response.should redirect_to(code_path(code: 'hoge'))
    end
  end

end
