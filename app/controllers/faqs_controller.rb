class FaqsController < InheritedResources::Base

    skip_before_action :authorized, only: [:css, :fpsc, :ppsc, :kppsc, :spsc, :bpsc, :nts, :pts, :ots]
  
    def css
    end
  
    def fpsc
    end

    def ppsc
    end

    def kppsc
    end

    def spsc
    end

    def bpsc
    end

    def nts
    end

    def pts
    end

    def ots
    end
  
    # private
  
    #   def mcq_params
    #     params.require(:mcq).permit(:subject, :question, :optionA, :optionB, :optionC, :optionD, :optionE, :correctOption, :moreInfo)
    #   end
  
  end
  