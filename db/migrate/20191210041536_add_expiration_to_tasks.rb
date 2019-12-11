class AddExpirationToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :expiration, :date, null: false, default: -> { 'NOW()' }


  end
end
