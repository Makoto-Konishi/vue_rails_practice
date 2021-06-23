class Employee < ApplicationRecord
  GENDERS = { other: 0, male: 1, female: 2 }

  enum gender: GENDERS
  # GENDERS.keys.concat(GENDERS.keys.map(&:to_s)) => [:other, :male, :female, "other", "male", "female"]
  validates :gender, inclusion: { in: GENDERS.keys.concat(GENDERS.keys.map(&:to_s)) }, exclusion: { in: [nil] }
  validates :name, exclusion: { in: [nil, ""] }
  validates :department, exclusion: { in: [nil] }
  # numericality 属性の値が数値のみかどうかを検証
  validates :payment, numericality: true, exclusion: { in: [nil] }
  validates :note, exclusion: { in: [nil] }
end
