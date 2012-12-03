class HomeController < ApplicationController
  before_filter :authenticate_user!
  def login
  end

  def index
  end

  def add

    if params[:submit]
      rec = Transaction.new
      rec.update_attributes(params[:transaction])

      if !rec.save
      	throw rec.errors
      end
  	end



  end

end
