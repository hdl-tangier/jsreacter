class AddSeoColumnToMeetup < ActiveRecord::Migration[5.0]
  def change
    add_column :meetups, :seo, :string
  end
end
