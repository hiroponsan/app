class TestsController < ApplicationController
  before_action :authenticate_user!
  # GET /tests
  # GET /tests.json
  def index
    @tests = Test.all
  end

  # GET /tests/1
  # GET /tests/1.json
  def show
    @product = Product.find(params[:id])
    @tests = @product.tests
    end
  

  # GET /tests/new
  def new
    @test = current_user.tests.build

  end

  # GET /tests/1/edit
  def edit
  end

  # POST /tests
  # POST /tests.json
  def create
    @test = current_user.tests.build(test_params)

    respond_to do |format|
      if @test.save
        format.html { redirect_to thank_you_path, notice: 'Test was successfully created.' }
        format.json { render :show, status: :created, location: @test }
      else
        format.html { render :new }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    respond_to do |format|
      if @test.update(test_params)
        format.html { redirect_to @test, notice: 'Test was successfully updated.' }
        format.json { render :show, status: :ok, location: @test }
      else
        format.html { render :edit }
        format.json { render json: @test.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    @test.destroy
    respond_to do |format|
      format.html { redirect_to tests_url, notice: 'Test was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    def set_product
    @product = Product.find(entry_params[:id])
    end

  private
    # Use callbacks to share common setup or constraints between actions.

    def entry_params
      params.permit(:id)
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def test_params
      params.permit(:product_id, :year, :semester, :textbook, :image, :user_id )
    end
end
