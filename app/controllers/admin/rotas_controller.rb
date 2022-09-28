class Admin::RotasController < ApplicationController

  def index
    @rotas = Rota.all
  end

  def new
    @rota = Rota.new
  end

  def create
    @rota = Rota.new(rota_params)
    if @rota.save
      redirect_to admin_rotas_path, notice: 'rota saved'
    else
      render :edit, alert: 'rota was not saved'
    end
  end

  def edit
  end

  def update
    @rota.assign_attributes(rota_params)
    if @rota.save
      redirect_to admin_rotas_path 
    else
      render :edit, alert: 'rota was not saved'
    end
  end

  def show
  end

  def delete
    raise
  end

  private

  def rota_params
    params.require(:rota).permit(:month, :attachment)
  end

end
