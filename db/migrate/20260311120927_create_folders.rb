class CreateFolders < ActiveRecord::Migration[8.1]
  def change
    create_table :folders do |t|
      t.string :name
      t.string :path

      t.timestamps
    end

    add_index :folders, :path
  end
end
