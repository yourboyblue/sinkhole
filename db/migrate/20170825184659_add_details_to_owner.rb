class AddDetailsToOwner < ActiveRecord::Migration[5.1]
  def change
    add_column :owners, :name, :string
    add_column :owners, :team_name, :string
  end
end
