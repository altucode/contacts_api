class UsersController < ApplicationController
  def index
    render text: {key: 'value'}.to_json
  end

  def create
    render text: {key: 'value'}.to_json
  end

  def show
    render text: {key: 'value'}.to_json
  end

end
