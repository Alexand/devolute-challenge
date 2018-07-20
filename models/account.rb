# frozen_string_literal: true

class Account < Sequel::Model
  plugin :validation_helpers

  attr_accessor :password, :password_confirmation

  def validate
    validate_email
  end

  def validate_email
    validates_presence :email
    validates_length_range 3..100, :email unless email.nil?
    validates_unique :email unless email.nil?
    validates_format(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :email) unless email.nil?
  end
end
