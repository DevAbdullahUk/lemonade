class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :edit_test, only: %i[ edit ]
  before_action :view_test, only: %i[ show ]
  include ProjectsHelper

  # GET /tests or /tests.json
  def index
    @tests = Test.all
  end

  # GET /tests/1 or /tests/1.json
  def show
  end

  # GET /tests/new
  def new
    @test = Test.new
    @project = Project.new
    @project_list = []

    ProjectUser
      .where(userId: current_user.id)
      .each { |record| @project_list << Project.find_by(id: record.projectId) }
    
    @project_list.compact!
  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests or /tests.json
  def create
    @test = Test.new(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to root_path, notice: "Test was successfully created." }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1 or /tests/1.json
  def update
    @test = Test.find(params[:id])

    if (@test&.project_id &&
        is_project_owner(current_user.id.to_s, @test.project_id.to_s))
      if @test.update(test_params)
        respond_to { |format| format.html { redirect_to root_path, notice: "Test was successfully updated." } }
      else
        respond_to { |format| format.html { redirect_to root_path, alert: "Error updating the test" } }
      end
    else
      respond_to { |format| format.html { redirect_to root_path, alert: "You don't have the permission to edit this test" } }
    end
  end

  # DELETE /tests/1 or /tests/1.json
  def destroy
    @test = Test.find(params[:id])

    if (@test&.project_id &&
        is_project_owner(current_user.id.to_s, @test.project_id.to_s))
      if @test.destroy
        respond_to { |format| format.html { redirect_to root_path, notice: "Test was successfully deleted." } }
      else
        respond_to { |format| format.html { redirect_to root_path, alert: "Error deleteing the test" } }
      end
    else
      respond_to { |format| format.html { redirect_to root_path, alert: "You don't have the permission to edit or delete this test" } }
    end
  end

  private

  def edit_test
    project_id = get_project_id(params[:project], Project.all)

    if (project_id &&
        is_project_owner(current_user.id.to_s, project_id.to_s) &&
        is_project_contains_test(params[:id].to_i, project_id.to_i))
      @test = Test.find(params[:id])
      @project = Project.find(project_id)
    else
      respond_to { |format| format.html { redirect_to root_path, alert: "You don't have access to edit or delete this test" } }
    end
  end

  def view_test
    project_id = get_project_id(params[:project], Project.all)

    if (project_id &&
        is_project_contains_test(params[:id].to_i, project_id.to_i) &&
        (is_project_owner(current_user.id.to_s, project_id.to_s) ||
         is_project_guest(current_user.id.to_s, project_id.to_s)))
      @test = Test.find(params[:id])
      @project = Project.find(project_id)
    else
      respond_to { |format| format.html { redirect_to root_path, alert: "You don't have access to view this test" } }
    end
  end

  # Only allow a list of trusted parameters through.
  def test_params
    params.require(:test).permit(:tag, :description, :name, :steps, :status, :project_id)
  end
end
