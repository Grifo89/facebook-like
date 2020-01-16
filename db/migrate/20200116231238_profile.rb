class Profile < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :birth_name
      t.string :profile_picture
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
