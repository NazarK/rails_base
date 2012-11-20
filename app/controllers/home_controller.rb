class HomeController < ApplicationController
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
