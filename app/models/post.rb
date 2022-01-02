class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  belongs_to :moderator

  validates :title, presence: true
  validates :content, presence: true
  validates_uniqueness_of :content, scope: %i[title]

  accepts_nested_attributes_for :post_tags

  scope :published, -> { where(publish: true).order(id: :desc) }
  scope :popular, -> { joins(:comments).order("comments_count DESC").uniq }

  has_many_attached :images


  def self.matching_title_or_content search
    where('title LIKE ? OR content LIKE ?', "%#{search}%", "%#{search}%")
  end

  def self.filter_by_tags param_tag
    includes(:tags).where(publish: true, tags: { name: param_tag }).order(id: :desc)
  end

  def self.save_json_file_content(hash_data, moderator_id)
    hash_data.each do |record|
      title = record['title']
      content = record['content']
      post = Post.new(title: title, content: content, publish: true, moderator_id: moderator_id)
      post.save
    end
  end
end