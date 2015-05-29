class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.boolean :agree, :default => :false
      t.integer :user_id
      t.integer :argument_id
      t.timestamps
    end
  end
end
