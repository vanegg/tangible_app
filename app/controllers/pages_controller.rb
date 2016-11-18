class PagesController < ApplicationController
  def newpage
  	p params
  	p current_page_id = params[:page]
  	p current_page = Page.find(current_page_id)
  	p 'hola mundo'
  end
end
