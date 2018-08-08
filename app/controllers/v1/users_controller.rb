class V1::UsersController < ApplicationController
	before_action :authenticate_user, only: [:create, :update]
	before_action :set_user, only: [:show, :update, :delete]
	def create
		user = User.new(user_params)
		user.save!
			render json: {status: "OK", message:"user created"}, status: 201
		# 	render json: {status: "Failed", message:"user cannot be created"}, status: :unprocessable_entity 
	end	

	def index
		users = User.all
		render json:{ users: users }, status: :ok
	end	

	def show
		# user=User.find(params[:id])	
		# perbedaan findby find where
		# findby -> mencari 1 / pertama. parameternya apapun bisa
		# wherer -> banyak
		# find ->paramsnya id
		render json:{ user: @user }, status: :ok
	end	

	def update
	    # user = User.find(params[:id])
	    @user.update(update_params)
	    render json: { status: "OK", message: "user updated", user: @user }, status: 200
  	end

	def delete
		# user=User.find(params[:id])
		@user.destroy
		head 204
	end	

	private
	def user_params
		params.require(:user).permit(:name, :email, :password)
		# permit -> whitelist parameternya yang mau diisi , :password_confirmation
	end	

	def update_params
    params.require(:user).permit(:name, :email)
	end
	
	def set_user
		@user = User.find(params[:id])
	end	


end