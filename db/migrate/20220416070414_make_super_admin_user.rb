class MakeSuperAdminUser < ActiveRecord::Migration[6.1]
  def change
      user = User.new(
      email: "kurt.peniket@gmail.com",
      password: "Pass@1234",
      super_admin: true
    )
    user.save!
  end
end
