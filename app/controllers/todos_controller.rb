class TodosController < ApplicationController
	before_action :get_todo, only: [:show, :edit, :update, :destroy]

	def create
		todo = Todo.new(tasks: params[:todo][:tasks], finished: params[:todo][:finished])
		todo.save!

		redirect_to root_path
	end

	def new
		@todo = Todo.new
	end


	def index
		@todos = Todo.all
	end

	def edit
		@todo = Todo.find(params[:id])
	end

	def show
		@todo = Todo.find(params[:id])
	end

	def update
		@todo = Todo.find(params[:id])
		@todo.update(todo_params)
		@todo.save!
		
		redirect_to todo_path(@todo.id)
	end


	private 
		def todo_params
			params.require(:todo).permit(:tasks, :finished)
		end

		def get_person
			@todo = Todo.find(params[:id])
		end
end