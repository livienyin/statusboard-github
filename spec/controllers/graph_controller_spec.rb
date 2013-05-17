require 'spec_helper'

describe GraphController do
  describe "#index" do
  end

  describe "#morris" do

    it "responds successfully" do
      get :morris
      expect(response).to be_success
    end

    it "assigns a data array" do
      get :morris
      expect(response).to be_success
    end
    
  end

  describe "#statusboard" do
    it "responds sucessfully to statusboard.json" do
      get :statusboard
      expect(response).to be_success
    end

    it "assigns a statusboard hash" do
      get :statusboard
      expect(:statusboard).to be_an Hash
    end
  end
  
end

