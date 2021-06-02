class CreateProspects < ActiveRecord::Migration[6.1]
  def change
    create_table :prospects do |t|
      t.string :name
      t.string :notes
      t.string :email
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
