# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  short_url  :string           not null
#  long_url   :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ShortenedUrl < ApplicationRecord
    validates :user_id, :short_url, :long_url, presence: true, uniqueness: true

    def self.random_code
        random = SecureRandom::urlsafe_base64[0..5]
        until !ShortenedUrl.exists?(random)
            random = SecureRandom::urlsafe_base64[0..5]
        end
        short_url = 'www.shortaf.com/' + random
    end

    def self.new_url(user, long_url)
        ShortenedUrl.create!(
            user_id:user.id, 
            long_url:long_url, 
            short_url:ShortenedUrl.random_code
        )
    end

    belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
    
end
