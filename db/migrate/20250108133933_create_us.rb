class CreateUs < ActiveRecord::Migration[8.0]
  def change
    create_table :us do |t|
      t.string :name
      t.string :password_digest

      t.timestamps
    end
  end
end
