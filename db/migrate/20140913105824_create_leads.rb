class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.text :proprty_status
      t.integer :worker_id
      t.timestamps
    end
  end
end
