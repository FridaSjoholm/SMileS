class TextsController < ApplicationController

  def index
    @texts = Text.all
    @text = Text.new
  end


  def show
  end

  def new
    @text = Text.new
    respond_to do |format|
      format.html {redirect_to new_text_path}
      format.js {}
    end
  end

  def edit
  end

  def create
    @text = Text.new(text_params)

    respond_to do |format|
      if @text.save
        flash[:success] = 'Text was successfully created.'
        format.html { redirect_to @text }
        format.js {}
        format.json { render json: @text, status: :created, location: @text }
      else
        flash[:danger] = 'There was a problem creating the Text.'
        format.html { render :new }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @text.update(text_params)
        flash[:success] = 'text was successfully updated.'
        format.html { redirect_to @text }
        format.json { render :show, status: :ok, location: @text }
      else
        flash[:danger] = 'There was a problem updating the text.'
        format.html { render :edit }
        format.json { render json: @text.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @text.destroy
    respond_to do |format|
      flash[:success] = 'text was successfully destroyed.'
      format.html { redirect_to texts_url }
      format.json { head :no_content }
    end
  end

  private
    def set_text
      @text = Text.find(params[:id])
    end

    def text_params
      params.require(:message).permit(:message, :time)
    end
