class MainController < ApplicationController
  def index
  end

  def show
    @code = params[:code]
    @arr = @code.split(//)
  end

  def search
    redirect_to code_path(code: params[:code])
  end
end
