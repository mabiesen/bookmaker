class StudyNotesController < ApplicationController
  before_action :set_study_note, only: %i[show edit update destroy]

  # GET /study_notes or /study_notes.json
  def index
    @study_notes = StudyNote.all
  end

  # GET /study_notes/1 or /study_notes/1.json
  def show; end

  # GET /study_notes/new
  def new
    @study_note = StudyNote.new
  end

  # GET /study_notes/1/edit
  def edit; end

  # POST /study_notes or /study_notes.json
  def create
    @study_note = StudyNote.new(study_note_params)

    respond_to do |format|
      if @study_note.save
        format.html { redirect_to study_note_url(@study_note), notice: 'Study note was successfully created.' }
        format.json { render :show, status: :created, location: @study_note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @study_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /study_notes/1 or /study_notes/1.json
  def update
    respond_to do |format|
      if @study_note.update(study_note_params)
        format.html { redirect_to study_note_url(@study_note), notice: 'Study note was successfully updated.' }
        format.json { render :show, status: :ok, location: @study_note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @study_note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /study_notes/1 or /study_notes/1.json
  def destroy
    @study_note.destroy!

    respond_to do |format|
      format.html { redirect_to study_notes_url, notice: 'Study note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_study_note
    @study_note = StudyNote.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def study_note_params
    params.require(:study_note).permit(:study_book_id, :page_number, :note_text)
  end
end
