class GitGraph < ActiveRecord::Base
  attr_accessible :title, :body

  def fetch_repo_commits
    octo = Octokit::Client.new(:login => "me", :oauth_token => ENV['GITHUB_TOKEN'])
    repos = octo.repositories "livienyin"
    data = []
    repos.each do
      |repo| data << {
        :title => repo.name,
        :value => octo.commits({
          :user => "livienyin", :name => repo.name
        }).length
      }
    end
    return data
  end
  
end
