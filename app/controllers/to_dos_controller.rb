class ToDosController < ApplicationController
  def index
    respond_to do |format|
      format.html
      format.json { render json: index_json }
    end
  end

  def show
    @todo = ToDo.find(params[:id])
  end

  private
  def index_json
    todos = ToDo.all.map do |todo|
      {
        id: todo.id,
        title: todo.title,
        url: to_do_path(todo.id),
        class: "event-#{todo.status}",
        start: todo.start_time.to_i * 1000,
        end: todo.end_time.to_i * 1000
      }
    end
    {
      success: 1,
      result: todos
    }
  end
end
