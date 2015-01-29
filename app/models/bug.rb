class Bug < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  belongs_to :user
  has_one :solution
  belongs_to :category

  validates :user, presence: true
  validates :content, :category, presence: true

  def require_user?
    true
  end

  class << self
    def permit_attributes
      [:content, :category_id]
    end
  end
end
Bug.import
