class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @rotas = Rota.all # add a date scope here
  end
end
