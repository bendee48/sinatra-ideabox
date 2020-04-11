class Idea
  include Comparable

  attr_reader :title, :description, :id
  attr_accessor :rank

  def initialize(attributes)
    @title = attributes['title']
    @description = attributes['description']
    @rank = attributes['rank'] || 0
    @id = attributes['id']
  end

  def save
    IdeaStore.create(to_h)
  end

  def to_h
    {
      'title' => title, 
      'description' => description, 
      'rank' => rank
    }
  end

  def like!
    self.rank += 1
  end

  def <=>(other)
    other.rank <=> self.rank
  end
end