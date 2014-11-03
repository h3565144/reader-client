class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string   :url,   null: false
      t.string   :name,  null: false
      t.column   :avatar, :oid
      t.datetime :fetched_at

      t.timestamps
    end
  end
end
