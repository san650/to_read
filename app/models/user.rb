class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable,
         :rememberable, :trackable, :validatable

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  has_many :bookmarks, :conditions => { :pending => true }, order: 'created_at ASC'
  has_many :resources, through: :bookmarks

  def self.assign_resource_to_everyone(resource)
    User.all.each do |user|
      user.bookmarks.create({
        :resource_id => resource.id,
        :user_id     => user.id
      })
    end
  end
end
