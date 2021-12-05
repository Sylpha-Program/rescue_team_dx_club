class CreateTypes < ActiveRecord::Migration[5.2]

  def change
    create_table :types do |t|
      t.string :name
      t.string :image
      t.string :color
      t.timestamps
    end
  end

end
