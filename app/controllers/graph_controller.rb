class GraphController < ApplicationController

  def morris
    gitgraph = GitGraph.new
    @data = gitgraph.fetch_repo_commits
    render :json => @data
  end
  
  def statusboard
    gitgraph = GitGraph.new
    @data = gitgraph.fetch_repo_commits
    
    statusboard = {
      :title => 'Git Hub: Commits By Repo',
      :datasequences => [
        {
          :title => 'Commits By Repo',
          :datapoints => @data
        }
      ]
    }
    render :json => {graph: statusboard}
  end

end
