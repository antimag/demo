class ClientsController < ApplicationController
     layout "simple"

	def new
	  @client = Client.new
	end

	def create
	  @client = Client.new(params[:client].permit(:name, :surname, :contact, :email, :address))

	 if @client.save
    flash.now[:alert] = "Your client has created successfully"
	   redirect_to @client
	 else
	   render 'new'
	 end
	end

    def index
      debugger
      @clients=Client.all
    end	

    def show
      @client = Client.find(params[:id])
    end

    def edit
     @client = Client.find(params[:id])
    end

    def update
      @client = Client.find(params[:id])
 
      if @client.update(params[:client].permit(:name, :surname, :contact, :email, :address))
         flash.now[:alert] = "Your client has updated successfully"
        redirect_to @client
      else
        render 'edit'
      end
    end

    def destroy
      @client = Client.find(params[:id])
      @client.destroy
      redirect_to clients_path
    end
	
end
