class ThirdsController < ApplicationController
  
  def index
    @thirds = Third.all
  end

  def show
    @third = Third.find(params[:id])
  end

  def new
    @third = Third.new
  end

  def create
    @third = Third.new(third_params)
  
    if @third.save
      flash[:success] = 'Thirdが正常に投稿されました'
      redirect_to @third
    else
      flash.now[:danger] = 'Thirdが投稿されませんでした'
      render :new
    end
  
  end
  
  def edit
    @third = Third.find(params[:id])
  end
  
  def update
    @third = Third.find(prams[:id])
    
    if @third.update(third_params)
      flash[:success] = 'Thirdは正常に更新されました'
      redirect_to @third
    else
      flash.now[:danger] = 'Thirdは更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @third = Third.find(params[:id])
    @third.destroy
    
    flash[:success] = 'Thirdは正常に削除されました'
    redirect_to thirds_url
  end
 
 
 # Strong Parameter
 def third_params
   params.require (:third).permit(:content)
 end
end