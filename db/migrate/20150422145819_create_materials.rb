class CreateMaterials < ActiveRecord::Migration
  
  def change
    
    create_table :materials do |t|
      t.string :title
      t.string :level
      t.text :description
      t.string :link

      t.timestamps null: false
    end

    add_column :materials, :user_id, :integer
  	add_index :materials, :user_id
  
  end

end
