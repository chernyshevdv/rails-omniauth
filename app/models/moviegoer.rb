class Moviegoer < ApplicationRecord
  def self.create_with_omniauth(auth)
    Moviegoer.create!(
      :provider => auth['provider'],
      :uid => auth['uid'],
      :name => auth[:extra][:access_token].params[:screen_name])
  end

  def to_s
    uid()
  end
end
