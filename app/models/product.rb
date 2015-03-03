class Product < ActiveRecord::Base
  default_scope -> {order :title}
  scope :k, -> {where(:image_url => "k.jpg")}

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
