class JobsController < ApplicationController
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    Job.create(job_params)
    redirect_to jobs_path
  end

  def edit
    @job = Job.find(params[:id])
    # without anything written here, rails will try to render a view by this name
    # when you call render, any @variables will be passed
  end

  def update
    job = Job.find(params[:id])
    job.update(job_params)  #update_attributes = same
    redirect_to jobs_path
  end

  def destroy
    job = Job.find(params[:id])
    job.destroy
    redirect_to jobs_path
  end

  private

  def job_params
    params.require(:job).permit(:title, :description)
  end
end
