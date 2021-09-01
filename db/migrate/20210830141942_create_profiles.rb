class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.text :bio
      t.text :status
      t.belongs_to :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
