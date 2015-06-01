class AddTitlesToArguments < ActiveRecord::Migration
  def change
    add_column :arguments, :title, :string
  end
end
