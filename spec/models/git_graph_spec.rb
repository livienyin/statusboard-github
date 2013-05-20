require 'spec_helper'

describe GitGraph do

  before do
    @fake_client = double(Octokit::Client)
    @fake_client.stub!(:repositories).and_return([double(:name => "repo_name")])
    @fake_client.stub!(:commits).and_return(["These are supposed to be commit information things", "this content does not matter"])
    Octokit::Client.stub(:new).and_return(@fake_client)
    @username = "livienyin"
  end

  it "uses initialized username" do
    gitgraph = GitGraph.new(@username)
    expect(gitgraph.username).to eq "livienyin"
    @fake_client.should_receive(:commits).with({:user => @username, :name => "repo_name"})
    @fake_client.should_receive(:repositories).with(@username)
    data = gitgraph.fetch_repo_commits
  end

  it "creates a data array" do
    gitgraph = GitGraph.new(@username)
    returned_data = gitgraph.fetch_repo_commits
    expect(returned_data).to be_an Array
    returned_data.should == [{:title => "repo_name", :value => 2}]
  end

end
