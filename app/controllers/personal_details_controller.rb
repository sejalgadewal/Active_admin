class PersonalDetailsController < InheritedResources::Base
  before_action :set_personal_detail, only: %i[ show edit update destroy ]

  def index
    @personal_details = PersonalDetail.all
    render json: @personal_details
  end

  def new
    @personal_detail=PersonalDetail.new
  end

  def create
    @personal_detail=PersonalDetail.new(personal_detail_params)
    respond_to do |format|
      if @personal_detail.save
        format.html { redirect_to personal_detail_url(@personal_detail), notice: "Detail was successfully created." }
        format.json { render :show, status: :created, location: @personal_detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @personal_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end
  
  def update
    respond_to do |format|
      if @personal_detail.update(personal_detail_params)
        format.html { redirect_to personal_detail_url(@personal_detail), notice: "Detail was successfully updated." }
        format.json { render :show, status: :created, location: @personal_detail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @personal_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  def show

  end

  def destroy
    @personal_detail.destroy

    respond_to do |format|
      format.html { redirect_to personal_details_url, notice: "Detail was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  private

    def personal_detail_params
      params.require(:personal_detail).permit(:mobile, :email, :gender, :dob, :marital_status, :blood_group, :image, :video)
    end

    def set_personal_detail
      @personal_detail = PersonalDetail.find(params[:id])
    end


end
