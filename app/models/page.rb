class Page < ActiveRecord::Base
  attr_accessible :content, :title
  
  validates_presence_of :content, :title
  validates_uniqueness_of :title

  scope :published, where('published_on IS NOT NULL')
  scope :unpublished, where('published_on IS NULL')
  
  def publish
    # set publication date unless already set
    update_attribute(:published_on, Time.now) unless published_on
  end
  
  def unpublish
    update_attribute(:published_on, nil)
  end
  
  def total_word_count
    content.split.size + title.split.size
  end
end
