class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.string :description
      t.integer :owner_id
      t.string :kind
      t.string :severity
      t.string :status
      t.string :reporter_full_name

      t.timestamps
    end
  end
end
