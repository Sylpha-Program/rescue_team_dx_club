class PokemonsController < ApplicationController

  before_action :require_user_login
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def index
    @pokemons = Pokemon.where(user_id: current_user.id).order(number: :asc)
  end

  def new
    @pokemon = Pokemon.new
    @types = Type.order(id: :asc)
    @qualities = Quality.order(id: :asc)
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    @types = Type.order(id: :asc)
    @qualities = Quality.order(id: :asc)
    @pokemon.user_id = current_user.id
    if @pokemon.save
      flash[:success] = '登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '登録に失敗しました。'
      render :new
    end
  end

  def edit
    @types = Type.order(id: :asc)
    @qualities = Quality.order(id: :asc)
  end

  def update
    @types = Type.order(id: :asc)
    @qualities = Quality.order(id: :asc)
    if @pokemon.update(pokemon_params)
      flash[:success] = '更新しました。'
      redirect_to root_url
    else
      flash.now[:danger] = '更新に失敗しました。'
      render :edit
    end
  end

  def destroy
    @pokemon.destroy
    flash[:success] = "削除しました"
    redirect_to root_url
  end

  private

  def pokemon_params
    params.require(:pokemon).permit(:number, :name, :type_1_id, :type_2_id, :ability, :quality_id, :move_1_name, :move_1_type_id, :move_2_name, :move_2_type_id, :move_3_name, :move_3_type_id, :move_4_name, :move_4_type_id)
  end

  def ensure_correct_user
    @pokemon = Pokemon.find(params[:id])
    @user = User.find(@pokemon.user_id)
    if @user.id != current_user.id
      flash[:danger] = "権限がありません"
      redirect_to root_url
    end
  end

end
