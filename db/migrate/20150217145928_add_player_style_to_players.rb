# AddPlayerStyleToPlayers
class AddPlayerStyleToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :player_style, :string, default: 'bat'
    add_index :players, :player_style
  end
end
