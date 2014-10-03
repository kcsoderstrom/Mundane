class AddClaimedToHelpMes < ActiveRecord::Migration
  def change
    add_column :help_mes, :claimed, :boolean, null: false, default: false
  end
end
