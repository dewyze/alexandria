class Store < ApplicationRecord
  has_many :books, dependent: :destroy

  accepts_nested_attributes_for :books, allow_destroy: true, reject_if: :reject_books

  private

  def reject_books(attributes)
    %w[name].blank?
  end
end
