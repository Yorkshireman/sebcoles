class TestimonialsController < ApplicationController
  before_action :set_testimonial, only: [:show, :edit, :update, :destroy]
  before_action :user_signed_in?, except: [:index]
  before_action :student?, only: [:new]

  # GET /testimonials
  # GET /testimonials.json
  def index
    @testimonials = Testimonial.all
  end

  # GET /testimonials/1
  # GET /testimonials/1.json
  def show
  end

  # GET /testimonials/new
  def new
    @testimonial = current_user.testimonials.build
  end

  # GET /testimonials/1/edit
  def edit
  end

  # POST /testimonials
  # POST /testimonials.json
  def create
    @testimonial = current_user.testimonials.build(testimonial_params)

    respond_to do |format|
      if @testimonial.save
        format.html { redirect_to root_path, notice: 'Testimonial was successfully created. Thankyou!' }
        format.json { render :show, status: :created, location: @testimonial }
      else
        format.html { render :new }
        format.json { render json: @testimonial.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /testimonials/1
  # PATCH/PUT /testimonials/1.json
  def update
    respond_to do |format|
      if @testimonial.update(testimonial_params)
        format.html { redirect_to @testimonial, notice: 'Testimonial was successfully updated.' }
        format.json { render :show, status: :ok, location: @testimonial }
      else
        format.html { render :edit }
        format.json { render json: @testimonial.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /testimonials/1
  # DELETE /testimonials/1.json
  def destroy
    @testimonial.destroy
    respond_to do |format|
      format.html { redirect_to testimonials_url, notice: 'Testimonial was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_testimonial
      @testimonial = Testimonial.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def testimonial_params
      params.require(:testimonial).permit(:content)
    end

    def student?
      if user_signed_in? && current_user.type == "Student"
        return true
      else
        redirect_to root_path, notice: "You must be a student to do this."
      end
    end

end
