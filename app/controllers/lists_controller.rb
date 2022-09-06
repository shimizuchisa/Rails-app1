class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    # 1エラーが出たときにviewに表示するため、＠で変数にする
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new
    end
  end


  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id]) #@は要らない
    list.update(list_params) #@は要らない
    redirect_to list_path(list.id) #showへリダイレクトする。　@は要らない
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end

  private
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
