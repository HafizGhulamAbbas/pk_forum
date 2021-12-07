class McqsController < InheritedResources::Base

  def index
    # @mcqs = Mcq.page(params[:page]).per(Setting.post_per_page)
    if params[:q].present?
      query = params[:q]
      query = query.gsub("-", " ")
      @mcqs = Mcq.matching_subject(query).page(params[:page]).per(Setting.post_per_page)
    else
      @mcqs = Mcq.page(params[:page]).per(Setting.post_per_page)
    end

    if params[:pageTitle].present?
      @pageTitle = params[:pageTitle]
    end
  end

  def show
    @mcqs = Mcq.page(params[:page]).per(Setting.post_per_page)
  end

  private

    def mcq_params
      params.require(:mcq).permit(:subject, :question, :optionA, :optionB, :optionC, :optionD, :optionE, :correctOption, :moreInfo)
    end

end
