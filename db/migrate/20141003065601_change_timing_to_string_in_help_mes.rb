class ChangeTimingToStringInHelpMes < ActiveRecord::Migration
  def up
    remove_column :help_mes, :timing
    add_column :help_mes, :timing, :string
    change_column :help_mes, :timing, :string, null: false
  end

  def down
    add_column :help_mes, :timing, :datetime
    change_column :help_mes, :timing, :datetime, null: false
    remove_column :help_mes, :timing
  end
end
