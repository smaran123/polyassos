class CreateSiteVisits < ActiveRecord::Migration
  def change
    create_table :site_visits do |t|
    t.string :visitor_name
      t.date :inspectiondate
      t.text :comment
      t.integer :lead_id
      t.integer :property_id
      t.integer :worker_id
      t.timestamps
    end
  end
end
