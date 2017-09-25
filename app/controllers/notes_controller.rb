class NotesController < ApplicationController
  load_and_authorize_resource
  before_action :find_member, except: :index
  before_action :find_note, except: [:new, :create, :index]

  def index
    authorize! :manage, :all
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.member = @member

    if @note.save
      redirect_to @member, notice: 'Thanks for sharing this with us!'
    else
      render :new, notice: 'Sorry, something went wrong there.'
    end
  end

  def update
    if @note.update_attributes(note_params)
      redirect_to member_note_path(@member, @note), notice: 'Notes updated.'
    else
      render :edit, alert: 'Sorry, something went wrong there.'
    end
  end

  def delete
    authorize! :manage, @member
    if @note.destroy
      redirect_to @member, notice: "We've deleted the information we had stored about you."
    else
      redirect_to @member, alert: 'Sorry, something went wrong there. Please contact an organiser on Slack for help.'
    end
  end

  private

  def find_member
    @member = Member.friendly.find(params[:member_id])
  end

  def find_note
    @note = @member.notes.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:current_role, :learning_to_code, :actively_looking_for_engineering_role, :started_learning_to_code, :other_information, :admin_notes)
  end
end
