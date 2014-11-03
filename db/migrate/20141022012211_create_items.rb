class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string     :title,     null: false, index: true
      t.datetime   :published, null: false
      t.string     :author,    index: true
      t.string     :url
      t.text       :summary,   index: true
      t.text       :content,   index: true
      t.belongs_to :channel,   null: false, index: true
      t.boolean    :unread,    null: false, default: true

      t.timestamps
    end
  end
end
