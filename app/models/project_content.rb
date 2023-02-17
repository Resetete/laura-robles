class ProjectContent < ApplicationRecord
  validates :title, presence: true

  validates :description_en, presence: true
  validates :description_es, presence: true
  validates :description_de, presence: true
end