class CreateHelpMes < ActiveRecord::Migration
  def change
    create_table :help_mes do |t|
      t.string :author, null: false
      t.string :content, null: false
      t.datetime :timing, null: false
      t.boolean :resolved, null: false, default: false

      t.timestamps
    end
  end
end
