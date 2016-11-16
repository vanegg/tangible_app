class UsersController < ApplicationController
  before_action :correct_user,   only: [:edit, :update, :show, :new, :delete, :index]

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(params[:title])
    current_user.albums << 
  end
end