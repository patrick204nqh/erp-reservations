module Erp::Reservations
  class Reservation < ApplicationRecord
    before_create :generate_code

    validates :name, :phone, :email, :resdate, :restime, :numperson, presence: true
    validates_format_of :email, :allow_blank => true, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => " is invalid (Eg. 'user@domain.com')"
    validates_numericality_of :numperson, on: :create, :greater_than => 0,message: " number is greater than 0"

    def self.filter(query, params)
      params = params.to_unsafe_hash
      and_conds = []

      #filters
      if params["filters"].present?
        params["filters"].each do |ft|
          or_conds = []
          ft[1].each do |cond|
            or_conds << "#{cond[1]["name"]} = '#{cond[1]["value"]}'"
          end
          and_conds << '('+or_conds.join(' OR ')+')' if !or_conds.empty?
        end
      end

      #keywords
      if params["keywords"].present?
        params["keywords"].each do |kw|
          or_conds = []
          kw[1].each do |cond|
            or_conds << "LOWER(#{cond[1]["name"]}) LIKE '%#{cond[1]["value"].downcase.strip}%'"
          end
          and_conds << '('+or_conds.join(' OR ')+')'
        end
      end

      # add conditions to query
      query = query.where(and_conds.join(' AND ')) if !and_conds.empty?

      return query
    end

    def self.search(params)
      query = self.order("created_at DESC")
      query = self.filter(query, params)

      return query
    end

    def generate_code
      size = 4
			charset = %w{0 1 2 3 4 6 7 9 A B C D E F G H I J K L M N O P Q R S T U V W X Y Z}
			self.code = Time.now.strftime("%Y%m").last(4) + (0...size).map{ charset.to_a[rand(charset.size)] }.join
    end

    # get type options for contact
    def self.get_time_options()
      [
        {text: '10:00', value: '10:00'},
        {text: '10:15', value: '10:15'},
        {text: '10:30', value: '10:30'},
        {text: '10:45', value: '10:45'},
        {text: '11:00', value: '11:00'},
        {text: '11:15', value: '11:15'},
        {text: '11:30', value: '11:30'},
        {text: '11:45', value: '11:45'},
        {text: '12:00', value: '12:00'},
        {text: '12:15', value: '12:15'},
        {text: '12:30', value: '12:30'},
        {text: '12:45', value: '12:45'},
        {text: '13:00', value: '13:00'},
        {text: '13:15', value: '13:15'},
        {text: '13:30', value: '13:30'},
        {text: '13:45', value: '13:45'},
        {text: '14:00', value: '14:00'},
        {text: '14:15', value: '14:15'},
        {text: '14:30', value: '14:30'},
        {text: '14:45', value: '14:45'},
        {text: '15:00', value: '15:00'},
        {text: '15:15', value: '15:15'},
        {text: '15:30', value: '15:30'},
        {text: '15:45', value: '15:45'},
        {text: '16:00', value: '16:00'},
        {text: '16:15', value: '16:15'},
        {text: '16:30', value: '16:30'},
        {text: '16:45', value: '16:45'},
        {text: '17:00', value: '17:00'},
        {text: '17:15', value: '17:15'},
        {text: '17:30', value: '17:30'},
        {text: '17:45', value: '17:45'},
        {text: '18:00', value: '18:00'},
        {text: '18:15', value: '18:15'},
        {text: '18:30', value: '18:30'},
        {text: '18:45', value: '18:45'},
        {text: '19:00', value: '19:00'}
      ]
    end

  end
end
