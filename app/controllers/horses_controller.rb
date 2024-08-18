class HorsesController < ApplicationController
    before_action :set_horse, only: %i[edit update destroy]
  
    def index
      @horses = Horse.all
      @horse = Horse.new
    end
  
    def new
      @horse = Horse.new
    end
  
    def create
      @horse = Horse.new(horse_params)
      if @horse.save
        respond_to do |format|
          format.turbo_stream { render turbo_stream: turbo_stream.append('horses_list', partial: 'horse', locals: { horse: @horse }) }
          format.html { redirect_to horses_path, notice: "Horse was successfully created." }
        end
      else
        respond_to do |format|
          format.turbo_stream { render turbo_stream: turbo_stream.replace('form', partial: 'form', locals: { horse: @horse }) }
          format.html { render :new, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      if @horse.update(horse_params)
        respond_to do |format|
          format.turbo_stream
          format.html { redirect_to horses_path, notice: "Horse was successfully updated." }
        end
      else
        respond_to do |format|
          format.turbo_stream { render turbo_stream: turbo_stream.replace('form', partial: 'form', locals: { horse: @horse }) }
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @horse.destroy
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.remove(dom_id(@horse)) }
        format.html { redirect_to horses_path, notice: "Horse was successfully destroyed." }
      end
    end
  
    private
  
    def set_horse
      @horse = Horse.find(params[:id])
    end
  
    def horse_params
      params.require(:horse).permit(:name, :race, :color, :stable_id)
    end
  end
  