class AnswerRegist::CorrectsController < ApplicationController 

    before_action :authenticate_admin!

    # GET /answer_regist/corrects/new
    def new
        @correct = Correct.new
    end

    # GET /answer_regist/corrects/edit
    def edit
        @correct = Correct.new
        @correct.instance_variable_set(:@method,'put')
        @correct.stage=params[:stage]
    end
    # GET /answer_regist/corrects
    def show
        @corrects=Correct.find_by_sql("select id, stage, correct, case when count is null then 0 else count end as corcount from corrects left join (select stage,count(*) from corrects left join answers using (stage)  where  correct = answer group by stage) correct_count  using (stage) ;")
    end
    # POST /answer_regist/corrects
    def create
        @correct=Correct.new
        @correct.assign_attributes(correct_params)
        print @correct.stage, @correct.correct
        @correct.save
        redirect_to action: 'show'
    end
    # PUT /answer_regist/corrects/1
    def update
        @correct.save
    end

    # DELETE /answer_regist/corrects/1
    def destroy
        @correct.destroy
    end


    private

    def get_correct
        @correct=Correct.find(params[:id])
    end

    def correct_params
      params.require(:correct).permit(:stage, :correct)
    end


end
