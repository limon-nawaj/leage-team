class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :club_id
      t.string :name
      t.string :captain
      t.datetime :date_created

      t.timestamps
    end
  end
end
