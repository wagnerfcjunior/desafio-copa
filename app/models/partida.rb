class Partida < ApplicationRecord
    has_many :time1_id, :class_name => 'Equipe', :foreign_key => 'id'
    has_many :time2_id, :class_name => 'Equipe', :foreign_key => 'id'
end