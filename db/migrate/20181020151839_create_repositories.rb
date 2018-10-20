class CreateRepositories < ActiveRecord::Migration[5.2]
  def change
    create_table :repositories do |t|
      t.string :owner, null: false
      t.string :name, null: false
      t.string :description
      t.string :language
      t.text :contributors, array: true, default: []

      t.timestamps
    end
  end
end
