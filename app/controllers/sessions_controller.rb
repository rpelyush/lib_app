class SessionsController < ApplicationController
  def new
    @login = Login.new
  end

  def create
    login = Login.new(params[:login])

    session[:reader_id] = login.authenticate
    redirect_to root_url, notice: 'Its working, yeah'
  end
end