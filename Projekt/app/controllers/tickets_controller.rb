class TicketsController < ApplicationController
  def show
    @article= Article.find(params[:article_id])
    @ticket=@article.tickets.find(params[:article_id])

  end
def index
      @article= Article.find(params[:article_id])
      @tickets=@article.tickets.all
    
  end
  def new
  end
def create
    @article = Article.find(params[:article_id])
  @ticket = @article.tickets.create(ticket_params)
    redirect_to article_path(@article)
  end
 
  def destroy
    @article = Article.find(params[:article_id])
    @ticket = @article.tickets.find(params[:id])
    @ticket.destroy
    redirect_to article_path(@article)
  end
  def edit
    @article= Article.find(params[:article_id])
    @ticket=@article.tickets.find(params[:id])
  
  end
  def update
  @article = Article.find(params[:article_id])
    @ticket = @article.tickets.find(ticket_params)
 
    if @ticket.update(ticket_params)
      redirect_to article_ticket_path(@article, @ticket)
  else
    render 'edit'
  end
end
  
  private
  def ticket_params
    params.require(:ticket).permit(:title, :description, :priority, :status, :difficulty)
    end
end
