class PagesController < ApplicationController
	def home
		@cat = Cat.all
		@todo = Todo.all
		@user = User.all
    end
end
