class TicketsController < ApplicationController
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
    @ticket = Ticket.find(params[:id])
    
end
  def update
  @article = Article.find(params[:article_id])
    @ticket = @article.tickets.update(ticket_params)
 
    if @ticket.update(ticket_params)
      redirect_to @ticket
  else
    render 'edit'
  end
end
  
  private
  def ticket_params
    params.require(:ticket).permit(:title, :description, :status, :difficulty)
    end
end
