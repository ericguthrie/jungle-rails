class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: 'jungle', password: 'book'

  def show
    @product = Product.order(id: :desc).all
  end

end
