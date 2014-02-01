class CreateBankUserAssociations < ActiveRecord::Migration
  def change
    create_table :bank_user_associations do |t|
      t.string :user_id
      t.string :bank_id
      t.float :account_money
 
      t.timestamps
    end
    add_index :bank_user_associations, :user_id
    add_index :bank_user_associations, :bank_id  
  end
end
