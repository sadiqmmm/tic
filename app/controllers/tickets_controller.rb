class TicketsController < ApplicationController

	before_action :set_project
	before_action :set_ticket, only: [:show, :create, :update, :destroy]

	def index
		@tickets = @project.tickets.order(id: :desc)
	end

	def show
	end

	def new
		@ticket = @project.tickets.build
	end

	def create
		@ticket = @project.tickets.build(ticket_params)
		
		if @ticket.save
			redirect_to [@project, @ticket]
		else
			render 'new'
		end
	end

	private

	def set_project
		@project = Project.find(params[:project_id])
	end
	
	def set_ticket
		@ticket = Ticket.find(params[:id])
	end

	def ticket_params
		params.require(:ticket).permit(:name, :description)
	end
end
