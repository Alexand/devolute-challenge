# frozen_string_literal: true

FactoryBot.define do
  sequence(:password) { |n| "P4ssword#{n}" }

  factory :account do
    sequence(:name) { |n| "Account Name #{n}" }
    # Set initial sequence value to be above the last account id, to prevent email collision
    sequence(:email, Account.last&.id&.+(1) || 1) { |n| "account#{n}@devolute.com" }
    password { generate(:password) }
    password_confirmation { password }
    role "user"
    # password { generate(:password) }
    # password_confirmation { password }
  end
end
