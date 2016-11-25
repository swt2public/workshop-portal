# == Schema Information
#
# Table name: events
#
#  id               :integer          not null, primary key
#  name             :string
#  description      :string
#  max_participants :integer
#  date_ranges      :Collection
#  active           :boolean
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Event < ActiveRecord::Base
  has_many :application_letters
  has_many :date_ranges

  validates :max_participants, numericality: { only_integer: true, greater_than: 0 }




  #TODO: This validation kills things.
  # validate :has_date_ranges
  #
  #def has_date_ranges
  #   errors.add(:base, 'Bitte mindestens eine Zeitspanne auswählen!') if date_ranges.blank?
  #  end
end
