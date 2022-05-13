class Admin::CongregationsController < ApplicationController
  before_action :set_congregation, only: [:edit, :update, :show, :join_congregation]

  def index
    @congregations = Congregation.active
  end

  def new
    @congregation = Congregation.new
  end

  def create
    @congregation = Congregation.new(congregation_params)
    @congregation.token = SecureRandom.uuid
    if @congregation.save
      redirect_to congregations_path, notice: 'Congregation saved'
      UserRoleCongregation.find_or_create_by(
        user_id: current_user.id,
        role_id: Role.find_by(name: 'admin').id,
        congregation_id: @congregation.id
      )
    else
      render :edit, alert: 'Congregation was not saved'
    end
  end

  def edit
  end

  def update
    @congregation.assign_attributes(congregation_params)
    if @congregation.save
      redirect_to admin_congregations_path 
    else
      render :edit, alert: 'Congregation was not saved'
    end
  end

  def show
    @url = "#{request.base_url}/join_congregation/#{@congregation.id}/#{@congregation.token}"
  end

  def delete
    raise
  end

  def join_congregation
    if params[:token] == @congregation.token
      UserRoleCongregation.find_or_create_by(
        user_id: current_user.id,
        role_id: Role.find_by(name: 'admin').id,
        congregation_id: @congregation.id
      )
      redirect_to congregation_path(@congregation)
    else
      redirect_to root_path, alert: 'Invaild join link'
    end
  end

  private

  def set_congregation
    @congregation = Congregation.find(params[:id])
  end

  def congregation_params
    params.require(:congregation).permit(:name)
  end

end
