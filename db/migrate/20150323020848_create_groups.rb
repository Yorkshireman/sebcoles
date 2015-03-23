class CreateGroups < ActiveRecord::Migration
  def up
    create_table :groups do |t|
    	t.string :title
    	t.belongs_to :teacher
      t.timestamps null: false
    end
  end

  def down
  	remove_table :groups
  end
end
