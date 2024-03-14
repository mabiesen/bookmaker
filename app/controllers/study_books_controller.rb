class StudyBooksController < ApplicationController
  before_action :set_study_book, only: %i[show edit update destroy]

  def index
    @study_books = StudyBook.all
  end

  def show; end

  def new
    @study_book = StudyBook.new
  end

  def edit; end

  def create
    @study_book = StudyBook.new(study_book_params)
    authors = StudyAuthor.find(study_book_params[:study_author_ids].reject(&:empty?))
    @study_book.study_authors << authors

    respond_to do |format|
      if @study_book.save
        format.html { redirect_to study_book_url(@study_book), notice: 'Study book was successfully created.' }
        format.json { render :show, status: :created, location: @study_book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @study_book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @study_book.update(study_book_params)
        format.html { redirect_to study_book_url(@study_book), notice: 'Study book was successfully updated.' }
        format.json { render :show, status: :ok, location: @study_book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @study_book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @study_book.destroy!

    respond_to do |format|
      format.html { redirect_to study_books_url, notice: 'Study book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_study_book
    @study_book = StudyBook.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def study_book_params
    params.require(:study_book).permit(:title, :summary, :number_of_pages, :completed, study_author_ids: [])
  end
end
