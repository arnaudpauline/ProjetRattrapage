class StablesController < ApplicationController
  before_action :set_stable, only: %i[show edit update destroy]

  # GET /stables
  def index
    @stables = Stable.includes(:horses).all
  end

  # GET /stables/1
  def show
    @address = @stable.address
    @number_of_horses = @stable.horses.count
  end

  # GET /stables/new
  def new
    @stable = Stable.new
    @stable.build_address # Pour créer une nouvelle adresse avec le stable
  end

  # GET /stables/1/edit
  def edit
    @address = @stable.address
  end

  # POST /stables
  def create
    @stable = Stable.new(stable_params)

    if @stable.save
      redirect_to @stable, notice: 'Stable was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stables/1
  def update
    if @stable.update(stable_params)
      redirect_to @stable, notice: 'Stable was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /stables/1
  def destroy
    @stable.destroy
    redirect_to stables_url, notice: 'Stable was successfully destroyed.'
  end

  private

    def set_stable
      @stable = Stable.find(params[:id])
    end

    def stable_params
      params.require(:stable).permit(:name, address_attributes: [:id, :line1, :zipcode, :city, :country])
    end
end
