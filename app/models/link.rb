class Link < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validates :url, presence: true
  validate :valid_url?

  def valid_url?
    if url
      uri = URI.parse(url)
      unless uri.kind_of?(URI::HTTP) or uri.kind_of?(URI::HTTPS)
        errors.add(:url, "this URL is not valid")
      end
    end
  end
end
