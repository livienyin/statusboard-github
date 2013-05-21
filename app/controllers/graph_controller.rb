class GraphController < ApplicationController

  def morris
    render :json => GitGraph.new("livienyin").fetch_repo_commits
  end

  def d3data
#    render :json => [{:title => "test_a", :value => 15}, {:title => "test_b", :value => 12}, {:title# => "test", :value => 15}, {:title => "dsaf", :value => 4}]
     render :json => GitGraph.new("livienyin").fetch_repo_commits
  end
  
  def statusboard
    statusboard = {
      :title => 'Git Hub: Commits By Repo',
      :datasequences => [
        {
          :title => 'Commits By Repo',
          :datapoints => GitGraph.new("livienyin").fetch_repo_commits
        }
      ]
    }
    render :json => {:graph => statusboard}
  end

end
