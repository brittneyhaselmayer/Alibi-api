class CreateMeetups < ActiveRecord::Migration[6.0]
  def change
    create_table :meetups do |t|
      t.references :alibi_1, references: :alibis, null: false, foreign_key: {to_table: :alibis}
      t.references :alibi_2, references: :alibis, null: false, foreign_key: {to_table: :alibis}
      t.references :event, null: false, foreign_key: true
      t.string :date

      t.timestamps
    end
  end
end
