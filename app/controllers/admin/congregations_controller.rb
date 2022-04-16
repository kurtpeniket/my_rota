class Admin::CongregationsController < ApplicationController
  def index
    raise User.first.congregations.inspect
    raise Congregation.first.users.inspect
  end
end
