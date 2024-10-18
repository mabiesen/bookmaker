class VerseCommentsController < ApplicationController
  before_action :set_verse_comment, only: %i[show edit update destroy]

  # GET /verse_comments or /verse_comments.json
  def index
    @verse_comments = VerseComment.all
  end

  # GET /verse_comments/1 or /verse_comments/1.json
  def show; end

  # GET /verse_comments/new
  def new
    @verse_comment = VerseComment.new
  end

  # GET /verse_comments/1/edit
  def edit; end

  # POST /verse_comments or /verse_comments.json
  def create
    @verse_comment = VerseComment.new(verse_comment_params)

    respond_to do |format|
      if @verse_comment.save
        format.html { redirect_to verse_comment_url(@verse_comment), notice: 'Verse Comment was successfully created.' }
        format.json { render :show, status: :created, location: @verse_comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @verse_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /verse_comments/1 or /verse_comments/1.json
  def update
    respond_to do |format|
      if @verse_comment.update(verse_comment_params)
        format.html { redirect_to verse_comment_url(@verse_comment), notice: 'Verse Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @verse_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @verse_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /verse_comments/1 or /verse_comments/1.json
  def destroy
    @verse_comment.destroy!

    respond_to do |format|
      format.html { redirect_to verse_comments_url, notice: 'Verse Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_verse_comment
    @verse_comment = VerseComment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def verse_comment_params
    params.require(:verse_comment).permit(:bible_verse_id, :comment)
  end
end
