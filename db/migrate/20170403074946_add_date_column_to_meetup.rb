class AddDateColumnToMeetup < ActiveRecord::Migration[5.0]
  def up
    add_column :meetups, :date, :date
    execute "UPDATE meetups SET date = '#{Date.current.to_s(:db)}' "
    change_column :meetups, :date, :date, null: false
  end

  def down
    remove_column :meetups, :date, :date
  end
end
