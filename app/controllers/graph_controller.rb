class GraphController < ApplicationController

  def morris
    render :json => GitGraph.new("livienyin").fetch_repo_commits
  end

  def d3-graph
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
