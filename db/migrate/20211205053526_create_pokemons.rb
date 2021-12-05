class CreatePokemons < ActiveRecord::Migration[5.2]

  def change
    create_table :pokemons do |t|
      t.references :user, foreign_key: true
      t.integer :number
      t.string :name
      t.references :type_1, foreign_key: { to_table: :types }
      t.references :type_2, foreign_key: { to_table: :types }
      t.string :ability
      t.references :quality, foreign_key: true
      t.string :move_1_name
      t.references :move_1_type, foreign_key: { to_table: :types }
      t.string :move_2_name
      t.references :move_2_type, foreign_key: { to_table: :types }
      t.string :move_3_name
      t.references :move_3_type, foreign_key: { to_table: :types }
      t.string :move_4_name
      t.references :move_4_type, foreign_key: { to_table: :types }
      t.timestamps
    end
  end

end
