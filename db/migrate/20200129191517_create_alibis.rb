class CreateAlibis < ActiveRecord::Migration[6.0]
  def change
    create_table :alibis do |t|
      t.string :when
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
