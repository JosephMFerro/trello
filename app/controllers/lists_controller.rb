class ListsController < ApplicationController
  before_action :set_list, except: [:index, :new, :create]
  before_action :set_board
  def index
    # organize by descending order
    @lists = @board.lists.except('order').order("id DESC")
  end

  def show
  end

  def new
    @list = @board.lists.new
  end

  def edit
  end

  def create
    @list = @board.lists.new(list_params)
    if @list.save
      redirect_to boards_path
    else
      render :new
    end
  end

  def update
    if @list.update(list_params)
      redirect_to board_lists_path
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to board_list_path
  end

  private
    def set_board
      @board = Board.find(params[:board_id])
    end
    def set_list
      @list = List.find(params[:id])
    end
    def list_params
      params.require(:list).permit(:name)
    end
end
