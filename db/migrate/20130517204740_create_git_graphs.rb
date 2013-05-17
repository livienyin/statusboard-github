class CreateGitGraphs < ActiveRecord::Migration
  def change
    create_table :git_graphs do |t|

      t.timestamps
    end
  end
end
