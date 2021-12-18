class StoresController < ApplicationController
  def new

    @store = Store.new
    @store.books.build
  end

  def create
    @store = Store.new(create_params)

    if @store
      flash[:success] = "Congrats on opening your store!"
      redirect_to @store
    else
      render :new
    end
  end

  def show
    @store = Store.includes(:books).find(params[:id])
  end

  def edit
    @store = Store.includes(:books).find(params[:id])
  end

  def update
    @store = Store.includes(:books).find(params[:id])

    if @store.update(update_params)
      flash[:success] = "Your inventory has been updated!"
      redirect_to @store
    else
      render :edit
    end
  end

  private

  def create_params
    params.require(:store).permit(:name, books_attributes: %i[title])
  end

  def update_params
    params.require(:store).permit(:id, :name, books_attributes: %i[id title _destroy])
  end
end
