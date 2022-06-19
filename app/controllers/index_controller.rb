class IndexController < ApplicationController
  before_action :authenticate_user!

  def home
    @project = Project.new
    @project_list = []


    ProjectUser
    .where(userId: current_user.id)
    .each{|record| @project_list << Project.find_by(id: record.projectId)}
  end
end
