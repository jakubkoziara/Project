class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :description
      t.string :status
      t.string :difficulty
      t.references :article, index: true

      t.timestamps null: false
    end
    add_foreign_key :tickets, :articles
  end
end
