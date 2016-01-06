class AddResponseToDomain < ActiveRecord::Migration
  def change
    add_column :domains, :response, :string
    add_column :domains, :title, :string
    add_column :domains, :resolves_to, :string
    add_column :domains, :verified_at, :datetime
  end
end
