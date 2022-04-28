class ShortenedUrl < ApplicationRecord
    validates :user_id, :short_url, :long_url, presence: true, uniqueness: true
end
