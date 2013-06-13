#encoding: utf-8
class DictionaryController < ApplicationController

  def index
    @dictionary = Dictionary.all
    respond_to do |format|
      format.html
      format.json {render json: @dictionary}
    end
  end

  def show
    @dictionary = Dictionary.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render json: @dictionary}
    end 
  end

  def new
    @dictionary = Dictionary.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contract }
    end
  end

  def destroy
    @dictionary = Dictionary.find(params[:id])
    @dictionary.delflag = 1
    respond_to do |format|
      if @dictionary.update_attributes(:delflag=>1)
        format.html {redirect_to dictionary_index_path , notice: "字典数据删除成功"}
        format.json {head :no_content}
      else
        format.html {render :action=>"index"}
        format.json {render json: @dictinary.errors, status: :unprocessable_entity}
      end 
    end
  end

  def create
    @dictionary = Dictionary.new(params[:dictionary])
    respond_to  do |format|
      if @dictionary.save
        format.html {redirect_to :controller=>"dictionary", :action=>"show", :id=> @dictionary.id, notice: "新增字典项成功"}
        format.json {render json: @dictionary ,status: :created, location: @dictionary}
      end
    end
  end
end
