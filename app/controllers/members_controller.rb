class MembersController < ApplicationController
  def show
    find_member
  end

  private

  def find_member
    @member = Api::Member.find(params[:id])
  end
end
