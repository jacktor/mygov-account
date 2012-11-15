require 'spec_helper'
include Warden::Test::Helpers

def create_logged_in_user(user)
  login(user)
  user
end

def login(user)
  login_as user, scope: :user
end

def create_approved_beta_signup(email_or_hash)
  email_or_hash = {email: email_or_hash} unless email_or_hash.kind_of? Hash
  beta_signup = BetaSignup.new(email_or_hash)
  beta_signup.is_approved = true
  beta_signup.save!
end
