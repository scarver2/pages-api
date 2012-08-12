class Page < ActiveRecord::Base
  attr_accessible :content, :title
  
  validates_presence_of :content, :title
  validates_uniqueness_of :title

  scope :published, where('published_on IS NOT NULL').order('published_on DESC')
  scope :unpublished, where('published_on IS NULL').order('updated_at DESC')
  
  def publish
    # set publication date unless already set
    if published_on
      errors.add :base, "Page has already been published."      
    else
      update_attribute(:published_on, Time.now)
    end
  end
  
  def unpublish
    update_attribute(:published_on, nil)
  end
  
  def total_word_count
    content.split.size + title.split.size
  end
end
