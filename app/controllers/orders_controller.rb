class OrdersController < ApplicationController
    def index
        @orders = Order.includes(:product).all
        @summary = Order.group(:product_id).count
    end
end
