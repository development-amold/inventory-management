class AccessoriesController < ApplicationController
  before_action :set_accessory, only: [:show, :edit, :update, :destroy]

  # GET /accessories
  # GET /accessories.json
  def index
    @accessories = Accessory.paginate(:page => params[:page],:per_page => 10)
  end

  # GET /accessories/1
  # GET /accessories/1.json
  def show
  end

  # GET /accessories/new
  def new
    @accessory = Accessory.new
  end

  # GET /accessories/1/edit
  def edit
  end

  # POST /accessories
  # POST /accessories.json
  def create
    @accessory = Accessory.new(accessory_params)
    if params[:acc_cat_type] == "pick"
      params[:accessory][:strap_id] = nil
    else
        params[:accessory][:pick_id] = nil  
    end

    respond_to do |format|
      begin
        if @accessory.save
          format.html { redirect_to @accessory, notice: 'Accessory was successfully created.' }
          format.json { render :show, status: :created, location: @accessory }
        else
          format.html { render :new }
          format.json { render json: @accessory.errors, status: :unprocessable_entity }
        end        
      rescue Exception => e
        Rails.logger.info "------Exception----#{e.message}----"
          format.html { render :new }
          format.json { render json: @accessory.errors, status: :unprocessable_entity }        
      end
    end
  end

  # PATCH/PUT /accessories/1
  # PATCH/PUT /accessories/1.json
  def update
    respond_to do |format|
      if @accessory.update(accessory_params)
        format.html { redirect_to @accessory, notice: 'Accessory was successfully updated.' }
        format.json { render :show, status: :ok, location: @accessory }
      else
        format.html { render :edit }
        format.json { render json: @accessory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accessories/1
  # DELETE /accessories/1.json
  def destroy
    @accessory.destroy
    respond_to do |format|
      format.html { redirect_to accessories_url, notice: 'Accessory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accessory
      @accessory = Accessory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accessory_params
      params.require(:accessory).permit(:pick_id, :strap_id, :brand_id, :name, :unit_price,:purchased_at)
    end
end
