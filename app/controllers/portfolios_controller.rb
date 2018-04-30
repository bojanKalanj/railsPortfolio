class PortfoliosController < ApplicationController
  before_action :set_portfolio_item only: [:edit, :update, :show, :destroy]
  layout "portfolios"
  def index
    @portfolio_items = Portfolio.all
  end

  def angular
    @angular_portfolio_items = Portfolio.angular
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)

      if @portfolio_item.save
        redirect_to portfolios_path
      else
        render 'new'
      end
  end

  def edit
    # @portfolio_item = Portfolio.find(params[:id])
  end

  def update

    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: '@portfolio_item was successfully created.' }
        format.json { render :show, status: :ok, location: @portfolio_item }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    # @portfolio_item = Portfolio.find(params[:id])
  end

  def destroy
    # @portfolio_item = Portfolio.find(params[:id])

    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Record was successfully destroyed.' }
    end
  end

  private
  def portfolio_params
    params.require(:portfolio).permit(:title,
                                      :subtitle,
                                      :body,
                                      technologies_attributes: [:name]
                                      )
  end

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end
end
