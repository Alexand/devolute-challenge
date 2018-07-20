# frozen_string_literal: true

class Account < Sequel::Model
  plugin :validation_helpers

  attr_accessor :password, :password_confirmation

  def validate
    validate_email
    validate_password
  end

  def validate_email
    validates_presence :email
    validates_length_range 3..100, :email unless email.blank?
    validates_unique :email unless email.blank?
    validates_format(/\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :email) unless email.blank?
  end

  def validate_password
    validates_presence %i[password password_confirmation] if password_required
    validates_length_range 4..40, :password unless password.blank?
    errors.add(:password_confirmation, "must confirm password") if !password.blank? && password != password_confirmation
  end

  def password_required
    crypted_password.blank? || password.present?
  end

  # Callbacks
  def before_save
    encrypt_password
  end

  private

  def encrypt_password
    self.crypted_password = ::BCrypt::Password.create(password) if password.present?
  end

  def password_required
    crypted_password.blank? || password.present?
  end
end
