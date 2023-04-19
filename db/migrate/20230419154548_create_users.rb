class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.text :photo
      t.text :bio
      t.timestamp :updated_at
      t.timestamp :created_at
      t.integer :posts_counter

      t.timestamps
    end
  end
end
