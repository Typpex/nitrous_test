class Admin::ScammersController < Admin::AdminController
  before_action :set_scammer, only: [:show, :edit, :update, :destroy]

  # GET /scammers
  # GET /scammers.json
  def index
    @scammers = Scammer.all
  end

  # GET /scammers/1
  # GET /scammers/1.json
  def show
  end

  # GET /scammers/new
  def new
    @scammer = Scammer.new
  end

  # GET /scammers/1/edit
  def edit
  end

  # POST /scammers
  # POST /scammers.json
  def create
    @scammer = Scammer.new(scammer_params)

    respond_to do |format|
      if @scammer.save
        format.html { redirect_to [:admin,@scammer], notice: 'Scammer was successfully created.' }
        format.json { render :show, status: :created, location: @scammer }
      else
        format.html { render :new }
        format.json { render json: @scammer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scammers/1
  # PATCH/PUT /scammers/1.json
  def update
    respond_to do |format|
      if @scammer.update(scammer_params)
        format.html { redirect_to @scammer, notice: 'Scammer was successfully updated.' }
        format.json { render :show, status: :ok, location: @scammer }
      else
        format.html { render :edit }
        format.json { render json: @scammer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scammers/1
  # DELETE /scammers/1.json
  def destroy
    @scammer.destroy
    respond_to do |format|
      format.html { redirect_to scammers_url, notice: 'Scammer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scammer
      @scammer = Scammer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scammer_params
      params.require(:scammer).permit(:name, :licence, :sexual_orientation, :birthday, :address)
      # params[:scammer]
    end
end
