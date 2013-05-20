require 'spec_helper'

describe GraphController do

  before do
    @fake_gitgraph = double(GitGraph)
    @fake_gitgraph.stub(:fetch_repo_commits).and_return([{:title => "repo_name", :value => 2}])
    GitGraph.stub(:new).and_return @fake_gitgraph
  end

  describe "#index" do

    it "renders index.html" do
    end
    
  end

  describe "#morris" do

    it "responds successfully" do
      get :morris
      expect(response).to be_success
    end

    it "assigns a data array" do
      get :morris
      expect(@data).to be_an Array
    end
    
  end

  describe "#statusboard" do
    
    it "responds sucessfully to statusboard.json" do
      get :statusboard
      expect(response).to be_success
    end

    it "instantiates gitgraph with the username livienyin" do
      GitGraph.should_receive(:new).with("livienyin")
      get :statusboard
    end
    
    it "assigns a statusboard hash" do
      get :statusboard
      expect(:statusboard).to be_an Hash
    end

    it "returns datasequences as an array" do
      pending
    end
    
  end
  
end

