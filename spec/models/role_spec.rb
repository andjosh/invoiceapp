# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Role do

  it { should have_db_column(:name).of_type(:string) }

  it { should have_and_belong_to_many(:users) }

  describe ".admin" do

    it "returns role with name 'admin'" do
      role = Role.admin

      role.name.should == "admin"
    end

  end

end
