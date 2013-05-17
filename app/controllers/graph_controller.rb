class GraphController < ApplicationController
  
  def statusboard
    # api calls and fetching data should be in model
    octo = Octokit::Client.new(:login => "me", :oauth_token => ENV['GITHUB_TOKEN'])
    repos = octo.repositories "livienyin"
    data = []
    repos.each do
      |repo| data << {
        "title" => repo.name,
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
