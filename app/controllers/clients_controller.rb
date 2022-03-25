class ClientsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  def index
    clients = Client.all
    render json: clients, status: :ok
  end

  def show
    client = Client.find(params[:id])
    count = client.memberships.count
    render json: { client: client, membership_count: count }, status: :ok
  end

  def update
    client = Client.find(params[:id])
    client.update!(client_params)
    render json: client, status: :ok
  end

  private
  
  def client_params
    params.permit(:name, :age)
  end
  
  def render_not_found
    render json: { error: "Client not found" }, status: :not_found
  end
end
