class GraphController < ApplicationController
  
  def statusboard
    octo = Octokit::Client.new
    repos = octo.repositories "livienyin"
    data = []
    repos.each do
      |repo| data << {
        "name" => repo.name,
        "value" => octo.commits({
          :user => "livienyin", :name => repo.name
        }).length
      }
    end
    statusboard = {
      'title' => 'Git Hub: Commits By Repo',
      'datasequences' => [
        {
          'title' => 'Commits By Repo',
          'datapoints' => data
        }
      ]
    }
    render :json => {graph: statusboard}
  end

end
