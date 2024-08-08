class TextsController < ApplicationController
  before_action :set_text, only: [:show, :edit, :update, :destroy]

  def index
    @texts = Text.all
  end

  def show
  end

  def new
    @text = Text.new
  end

  def edit
  end

  def create
    @text = Text.new(text_params)
    respond_to do |format|
      if @text.save
        flash[:notice] = "Text was saved successfully."
        format.js { }
      else
        format.js { }
      end
    end
  end

  def update
    respond_to do |format|
      if @text.update(text_params)
        format.html { redirect_to text_url(@text), notice: "Text was successfully updated." }
        format.json { render :show, status: :ok, location: @text }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @text.destroy!

    respond_to do |format|
      format.html { redirect_to texts_url, notice: "Text was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_text
      @text = Text.find(params[:id])
    end

    def text_params
      params.require(:text).permit(:key, :value)
    end
end
