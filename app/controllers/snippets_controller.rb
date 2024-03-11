class SnippetsController < ApplicationController
  before_action :set_snippet, only: %i[show edit update destroy]

  def index
    @snippets = Snippet.all
  end

  def show; end

  def new
    @snippet = Snippet.new
  end

  def edit; end

  def create
    @snippet = Snippet.new(snippet_params)

    respond_to do |format|
      if @snippet.save
        format.html { redirect_to snippet_url(@snippet), notice: 'Snippet was successfully created.' }
        format.json { render :show, status: :created, location: @snippet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @snippet.update(snippet_params)
        format.html { redirect_to snippet_url(@snippet), notice: 'Snippet was successfully updated.' }
        format.json { render :show, status: :ok, location: @snippet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @snippet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @snippet.destroy!

    respond_to do |format|
      format.html { redirect_to snippets_url, notice: 'Snippet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_snippet
    @snippet = Snippet.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def snippet_params
    params.require(:snippet).permit(:note)
  end
end
