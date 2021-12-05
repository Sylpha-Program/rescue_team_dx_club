class Pokemon < ApplicationRecord

  belongs_to :user
  belongs_to :type_1, class_name: 'Type', optional: true
  belongs_to :type_2, class_name: 'Type', optional: true
  belongs_to :quality, optional: true
  belongs_to :move_1_type, class_name: 'Type', optional: true
  belongs_to :move_2_type, class_name: 'Type', optional: true
  belongs_to :move_3_type, class_name: 'Type', optional: true
  belongs_to :move_4_type, class_name: 'Type', optional: true

end
