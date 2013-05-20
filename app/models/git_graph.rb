class GitGraph
  attr_reader :username

  def initialize(username)
    @username = username
  end

  def fetch_repo_commits
    octo = Octokit::Client.new(:login => "me", :oauth_token => ENV['GITHUB_TOKEN'])
    repos = octo.repositories @username
    data = []
    repos.each do |repo|
      data << {
        :title => repo.name,
        :value => octo.commits({
          :user => @username, :name => repo.name
        }).length
      }
    end
    return data
  end
  
end
