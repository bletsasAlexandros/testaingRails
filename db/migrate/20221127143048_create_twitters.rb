class CreateTwitters < ActiveRecord::Migration[7.0]
  def change
    create_table :twitters do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :twitter_account, null: false, foreign_key: true
      t.text :body
      t.datetime :publish_at
      t.string :tweed_id

      t.timestamps
    end
  end
end
