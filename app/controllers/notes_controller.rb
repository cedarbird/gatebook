class NotesController < ApplicationController

  before_action :set_note, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

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

  def create
    @note = current_user.notes.build(note_params)
    if @note.save
      redirect_to @note, notice: "submission was saved."
    else
      @notes = Note.all.order(created_at: :desc)
      render 'home/top'
    end
  end

  private
  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end

  def correct_user
    note = Note.find(params[:id])
    if !currentuser?(note.user)
      redirect_to root_path, alert: 'Not allowed!'
    end
  end

end
