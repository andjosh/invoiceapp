# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string(255)
#  company_name           :string(255)
#  address                :string(255)
#  city                   :string(255)
#  state                  :string(255)
#  zip                    :string(255)
#  phone                  :string(255)
#  office_phone           :string(255)
#  image                  :string(255)
#  about                  :text
#  website                :string(255)
#  tax                    :float
#  str_uid                :string(255)
#  str_token              :string(255)
#  str_pub                :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :company_name, :address, :city, :state, :zip, :phone, :office_phone, :image, :about, :website, :tax

  has_and_belongs_to_many :roles
  has_many :clients
  has_many :invoices
  belongs_to :category

  def to_param
    "#{id} #{name}".parameterize
  end

  def role?(role)
    return !!self.roles.find_by_name(role.to_s)
  end

  def make_admin
    self.roles << Role.admin
  end

  def revoke_admin
    self.roles.delete(Role.admin)
  end

  def admin?
    role?(:admin)
  end

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token['info']
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password.
      User.create!(:email => data["email"], :password => Devise.friendly_token[0,20], :name => access_token["extra"]["raw_info"]["name"], :image => data["image"], :about => access_token["extra"]["raw_info"]["work"][0]["position"]["name"])
    end
  end

  def self.stripe_oauth(data, current_user)
    current_user.str_uid = data['uid']
    current_user.str_pub = data['info']['stripe_publishable_key']
    current_user.str_token = data['credentials']['token']
    
  end

end
