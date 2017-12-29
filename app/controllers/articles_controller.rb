class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all  
  end
  
  def new
    #this creates the new row in the articles database so that the form can be created
    @article = Article.new 
  end
  
  def edit
    @article = Article.find(params[:id])
  end
  
  def create
    #debugger
    #render plain: params[:article].inspect
    #this populates the newly created row in the articles database with the information from the form
    @article = Article.new(article_params)
    @article.user = User.first
    if @article.save
      flash[:success] = "Article was saved successfully"
      redirect_to article_path(@article)
    else
      render 'new'
    end    
  end
  
    def update
      @article = Article.find(params[:id])
      if @article.update(article_params)
        flash[:success] = "Article was saved successfully"
        redirect_to article_path(@article)
      else
         render 'edit'
      end
    end
  
  def show
    @article = Article.find(params[:id])    
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:danger] = "Article was saved successfully"
    redirect_to articles_path
  end
  
  private
  
  def article_params
    params.require(:article).permit(:title, :description)
  end
  
end