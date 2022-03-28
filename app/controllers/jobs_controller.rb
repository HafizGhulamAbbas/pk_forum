class JobsController < ApplicationController
  
  #before_action :authenticate_user!, except: [:new]
  skip_before_action :authorized, only: [:index, :show, :new]

  def index
    @q = Job.ransack(params[:q])
    @jobs = @q.result(distinct: true).page(params[:page]).per(Setting.post_per_page)

  end

  def show
    @job = Job.find(params[:id])
  end


  def new
    @job = Job.new
  end

  def edit
  end

  def create
    @job = Job.new(job_params)
    @job.user_id = current_user.id
    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: "Job was successfully submitted." }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: "Job was successfully updated." }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: "Job was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    def set_job
      @job = Job.find(params[:id])
    end

  private

    def job_params
      params.require(:job).permit(:title, :user_id, :province, :department, :district, :opendate, :closedate, :url, :qualification, :salary, :eligibility, :description)
    end

end
