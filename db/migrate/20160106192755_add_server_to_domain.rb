class AddServerToDomain < ActiveRecord::Migration
  def change
    add_column :domains, :server, :string
  end
end
