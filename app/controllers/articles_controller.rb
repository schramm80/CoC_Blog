class ArticlesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]



  def index
    if user_signed_in?
      if current_user.role.name == "Admin"
        @articles = Article.all.order('created_at DESC')
      else
        @articles = Article.all.where(:published => true).order('created_at DESC')
      end
    else
      @articles = Article.all.where(:published => true).order('created_at DESC')
    end
  end


  def show
  end


  def new
    @article = Article.new
    @article.user = current_user
  end


  def edit
  end


  require "html_truncator"
  def create
    @article = Article.new(article_params)
    @article.preview = HTML_Truncator.truncate(@article.body, 300)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render action: 'show', status: :created, location: @article }
      else
        format.html { render action: 'new' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @article.preview = HTML_Truncator.truncate(article_params[:body], 300)

    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end


  def article_params
    params.require(:article).permit(:title, :body, :published)
  end
end
