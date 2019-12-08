class Article < ApplicationRecord
    # allow for multiple comments to be assoc w a single article
    has_many :comments, dependent: :destroy
    # ensure each article has a title, at least 5 chars long
    validates :title, presence: true,
        length: { minimum: 5 }
end
