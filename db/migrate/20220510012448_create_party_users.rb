class CreatePartyUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :party_users do |t|
      t.references :users, foreign_key: true
      t.references :parties, foreign_key: true
    end
  end
end
