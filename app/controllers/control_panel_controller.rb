class ControlPanelController < ApplicationController
  before_action :authenticate_user!, :admin_only

  def show
    @users = User.includes(:posts).all
  end

  private

  def admin_only
    unless current_user.admin?
      redirect_to root_path, alert: "Access denied."
    end
  end
end