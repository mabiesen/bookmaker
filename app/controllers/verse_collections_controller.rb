class VerseCollectionsController < ApplicationController
  before_action :set_verse_collection, only: %i[ show edit update destroy ]

  # GET /verse_collections or /verse_collections.json
  def index
    @verse_collections = VerseCollection.all
  end

  # GET /verse_collections/1 or /verse_collections/1.json
  def show
  end

  # GET /verse_collections/new
  def new
    @verse_collection = VerseCollection.new
  end

  # GET /verse_collections/1/edit
  def edit
  end

  # POST /verse_collections or /verse_collections.json
  def create
    @verse_collection = VerseCollection.new(verse_collection_params)
    verses = BibleVerse.find(verse_collection_params[:bible_verse_ids].reject(&:empty?))
    verses.each do |verse|
      unless @verse_collection.bible_verse_ids.include? verse.id
        @verse_collection.bible_verses << verse
      end
    end

    respond_to do |format|
      if @verse_collection.save
        format.html { redirect_to verse_collection_url(@verse_collection), notice: "Verse collection was successfully created." }
        format.json { render :show, status: :created, location: @verse_collection }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @verse_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /verse_collections/1 or /verse_collections/1.json
  def update
    respond_to do |format|
      if @verse_collection.update(verse_collection_params)
        format.html { redirect_to verse_collection_url(@verse_collection), notice: "Verse collection was successfully updated." }
        format.json { render :show, status: :ok, location: @verse_collection }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @verse_collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /verse_collections/1 or /verse_collections/1.json
  def destroy
    @verse_collection.destroy!

    respond_to do |format|
      format.html { redirect_to verse_collections_url, notice: "Verse collection was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_verse_collection
      @verse_collection = VerseCollection.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def verse_collection_params
      params.require(:verse_collection).permit(:comment, bible_verse_ids: [])
    end
end
