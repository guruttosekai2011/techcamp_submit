class MemosController < ApplicationController

  def create
    Memo.create(create_params)
    redirect_to :back
  end
  
  def new_create
    Memo.create(new_create_params)
    redirect_to "/memos/#{current_user.memos[0][:id]}/edit"
  end

  def show
    @memo = Memo.find(params[:id])
  end

  def edit
    @memo = Memo.find(params[:id])
    @user_memos = current_user.memos
  end

  def update
    memo = Memo.find(params[:id])
    if memo.user_id == current_user.id
      memo.update(update_params) 
    end
    redirect_to :back
  end

  def destroy
    memo = Memo.find(params[:id])
    if memo.user_id == current_user.id
      memo.destroy
    end
    redirect_to "/memos/#{current_user.memos[0][:id]}/edit"
  end

  def search
    limit_memos = Memo.where(public_open: '1')
    @memos = limit_memos.where('memo LIKE(?)', "%#{params[:keyword]}%")
  end

  def stack_search

    require 'net/http'
    require 'uri'
    require 'rexml/document'
    require 'json'

    search_word = params[:keyword]

    url = URI.parse(URI.escape("https://api.stackexchange.com/2.2/questions?order=desc&sort=activity&tagged=#{search_word}&site=ja.stackoverflow"))

    https=Net::HTTP.new(url.host, url.port)
    https.use_ssl=true
    res = https.start {|http|
        http.get(url.path + "?" + url.query);
    }

    hash = JSON.parse(res.body)
    
    @itemshash = hash['items']

  end

  private
  def create_params
    params.require(:memo).permit(:memo, :title, :public_open).merge(user_id: current_user.id)
  end

  def new_create_params
    nill_params = {"title"=>"新規ノートブック", "memo"=>"内容を入力してください", "public_open"=>"0"}
    nill_params.merge(user_id: current_user.id)
  end
  
  def update_params
    params.permit(:memo, :title)
  end

end
