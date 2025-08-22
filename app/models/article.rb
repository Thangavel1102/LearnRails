class Article < ApplicationRecord
    has_one_attached :image
    has_one_attached :article_doc

    validates :title, presence: true
end
