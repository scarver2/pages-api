class Page < ActiveRecord::Base
  attr_accessible :content, :published_on, :title
  
  validates_presence_of :content, :title
  validates_uniqueness_of :title

  def total_word_count
    content.split.size + title.split.size
  end
end
