class CreateShortners < ActiveRecord::Migration[6.1]
  def change
    create_table :shortners do |t|
      t.string :url
      t.string :slug

      t.timestamps
    end
  end
end
