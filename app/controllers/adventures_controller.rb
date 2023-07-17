class AdventuresController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_adventure, only: [:show, :edit, :update, :destroy]
  
  # GET /adventures or /adventures.json
  def index
    @adventures = Adventure.all
    @comments = Comment.all
    @reactions = Reaction.all
  end

  # GET /adventures/1 or /adventures/1.json
  def show
    @comment = Comment.new
    @adventure = Adventure.find(params[:id])
    @comments = @adventure.comments
    @reactions = @adventure.reactions
  end

  # GET /adventures/new
  def new
    if user_signed_in?
      @adventure = Adventure.new
    else
      flash[:notice] = 'Por favor registrate o entra a tu cuenta para publicar una aventura.'
      redirect_to new_user_session_path
    end      
  end

  # GET /adventures/1/edit
  def edit
  end

  # POST /adventures or /adventures.json
  def create
    if user_signed_in?
      @adventure = current_user.adventures.build(adventure_params)
      if @adventure.save
        redirect_to @adventure, notice: "Tu nueva aventura ha sido creada."
      else
        render :new
      end
    else
      redirect_to new_user_session_path, alert: "Debes iniciar sesión para crear una nueva aventura."
    end
  end
  
#    @adventure = current_user.adventures.new(adventure_params)
  
    respond_to do |format|
      if @adventure.save
        format.html { redirect_to @adventure, notice: "Tu nueva aventura ha sido creada." }
        format.json { render :show, status: :created, location: @adventure }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @adventure.errors, status: :unprocessable_entity }
      end
    end

  

  # PATCH/PUT /adventures/1 or /adventures/1.json
  def update
    respond_to do |format|
      if @adventure.update(adventure_params)
        format.html { redirect_to adventure_url(@adventure), notice: "Adventure was successfully updated." }
        format.json { render :show, status: :ok, location: @adventure }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @adventure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /adventures/1 or /adventures/1.json
  def destroy
    @adventure.destroy

    respond_to do |format|
      format.html { redirect_to adventures_url, notice: "Adventure was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_adventure
      @adventure = current_user.adventures.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def adventure_params
      params.require(:adventure).permit(:user_id, :title, :description, :place, :when_went)
    end
end
