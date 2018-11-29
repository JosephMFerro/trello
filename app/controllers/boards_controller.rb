class BoardsController < ApplicationController
  before_action :set_board, except: [:index, :new, :create]
  def index
    # organize by descending order
    @boards = Board.except('order').order("id DESC")
  end

  def show
  end

  def new
    @board = Board.new
  end

  def edit
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to boards_path
    else
      render :new
    end
  end

  def update
    if @board.update(board_params)
      redirect_to boards_path
    else
      render :edit
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path
  end

  private
    def set_board
      @board = Board.find(params[:id])
    end
    def board_params
      params.require(:board).permit(:name)
    end
end