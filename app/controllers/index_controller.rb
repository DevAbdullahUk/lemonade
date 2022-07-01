class IndexController < ApplicationController
  before_action :authenticate_user!
  include ProjectsHelper

  def home
    @project = Project.new
    @project_list = get_all_projects_for_user current_user.id

    project_id = get_project_id(params[:project], @project_list)
    @test_cases  = if (project_id)
                      Test.where(project_id: project_id).order(:id).page params[:page]
                    else
                      Test.order(:id).page params[:page]
                    end
  end 


  private

  def get_all_projects_for_user user_id
    project_list = []

    ProjectUser
    .where(userId: user_id)
    .each{|record| project_list << Project.find_by(id: record.projectId)}
    .then{project_list}
  end


  def get_project_id(project_uuid, project_list)
    is_valid_project_id = validate_uuid_format(project_uuid)


    if is_valid_project_id
      x = project_list
        .filter{|project| project.projectId.eql? project_uuid}
        &.first
        &.id
    else 
      nil 
    end
  end
    
end
