class Product < ActiveRecord::Base
  has_many :line_items
  has_many :orders, :through => :line_items
  
  default_scope -> {order :title}
  scope :k, -> {where(:image_url => "k.jpg")}

  before_destroy :ensure_not_referenced_by_any_line_items

  def ensure_not_referenced_by_any_line_items
    if line_items.count.zero?
      return true
    else
      errors[:base] << "Line items present"
      return false
    end
  end

  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :image_url, :format => {
    :with     => %r/\.(gif|png|jpg)\z/i,
    :messages => %{
      这些都是些什么鬼！！！
    }
  }
end
