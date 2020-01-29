class Pending < ApplicationRecord
  belongs_to :alibi_1, :class_name => 'Alibi'
  belongs_to :alibi_2, :class_name => 'Alibi'
  belongs_to :event
end
