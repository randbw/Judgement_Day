class CreateArguments < ActiveRecord::Migration
  def change
    create_table :arguments do |t|
      t.integer :user_id
      t.text :content
      t.boolean :voting_complete, :default => :false
      t.timestamps
    end
  end
end
