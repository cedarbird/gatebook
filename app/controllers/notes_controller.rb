class NotesController < ApplicationController

  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def new
    @note = Note.new
  end

  def show
  end

  def edit
  end

  def update
    if @note.update(note_params)
      redirect_to @note, notice: "submission was updated."
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    redirect_to notes_path
  end

  def index
    @notes = Note.all
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      redirect_to @note, notice: "submission was saved."
    else
      render :new
    end
  end

  private
  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end

end
