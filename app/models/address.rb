class Address < ApplicationRecord
    has_one :stable
  
      #validation du zipcode, si le country est france alors le zipcode doit être de 5 chiffres
    validates :zipcode, format: { with: /\A\d{5}\z/, message: I18n.t('errors.messages.invalid_zipcode') }, if: :france? 

  def france?
    country.downcase == 'france'
  end
end
  