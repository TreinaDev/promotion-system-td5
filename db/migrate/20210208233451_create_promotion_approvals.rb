class CreatePromotionApprovals < ActiveRecord::Migration[6.1]
  def change
    create_table :promotion_approvals do |t|
      t.references :promotion, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
