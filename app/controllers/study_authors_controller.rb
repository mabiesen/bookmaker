class StudyAuthorsController < ApplicationController
  before_action :set_study_author, only: %i[show edit update destroy]

  def index
    @study_authors = StudyAuthor.all
  end

  def show; end

  def new
    @study_author = StudyAuthor.new
  end

  def edit; end

  def create
    @study_author = StudyAuthor.new(study_author_params)

    respond_to do |format|
      if @study_author.save
        format.html { redirect_to study_author_url(@study_author), notice: 'Study author was successfully created.' }
        format.json { render :show, status: :created, location: @study_author }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @study_author.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @study_author.update(study_author_params)
        format.html { redirect_to study_author_url(@study_author), notice: 'Study author was successfully updated.' }
        format.json { render :show, status: :ok, location: @study_author }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @study_author.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @study_author.destroy!

    respond_to do |format|
      format.html { redirect_to study_authors_url, notice: 'Study author was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_study_author
    @study_author = StudyAuthor.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def study_author_params
    params.require(:study_author).permit(:first_name, :last_name)
  end
end
