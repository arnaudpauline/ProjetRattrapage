class Address < ApplicationRecord
    has_one :stable
  
    validates :zipcode, format: { with: /\A\d{5}\z/, message: I18n.t('errors.messages.invalid_zipcode') }, if: :france?

  def france?
    country.downcase == 'france'
  end
end
  