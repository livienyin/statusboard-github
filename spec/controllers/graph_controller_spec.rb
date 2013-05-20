require 'spec_helper'

describe GraphController do

  before do
    @graph_data = [{:title => "repo_name", :value => 2}]
    @fake_gitgraph = double(GitGraph)
    @fake_gitgraph.stub(:fetch_repo_commits).and_return(@graph_data)
    GitGraph.stub(:new).and_return @fake_gitgraph
  end

  describe "#index" do

    it "renders index.html successfully" do
      get :index
      expect(response).to be_success
    end
    
  end

  describe "#morris" do

    it "responds successfully" do
      get :morris
      expect(response).to be_success
    end
    
    it "instantiates gitgraph with the username livienyin" do
      GitGraph.should_receive(:new).with("livienyin")
      get :morris
    end

    it "renders json with correct arguments" do
      GraphController.any_instance.stub(:render)
      GraphController.any_instance.should_receive(:render).with(:json => @graph_data)
      get :morris
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

    it "renders json with correct arguments" do
      GraphController.any_instance.stub(:render)
      statusboard = {
        :title => 'Git Hub: Commits By Repo',
        :datasequences => [
        {
          :title => 'Commits By Repo',
          :datapoints => @graph_data
        }
       ]
      }
      GraphController.any_instance.should_receive(:render).with(:json => {:graph => statusboard})
      get :statusboard
    end
    
  end
  
end

