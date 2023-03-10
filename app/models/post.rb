class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: { in: ['Fiction','Non-Fiction'] }
    validate :title_is_clickbait

    def title_is_clickbait
        criteria = ["Won't Believe","Secret","Top [number]","Guess"]
        unless criteria.find{|e| self.title.to_s.include?(e)} || 
            errors.add(:title, "Need to have a clickbaity title")
        end
    end
end
