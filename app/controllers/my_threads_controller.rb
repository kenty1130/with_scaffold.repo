class MyThreadsController < ApplicationController
  before_action :set_my_thread, only: %i[ show edit update destroy ]

  # GET /my_threads or /my_threads.json
  def index
    @my_threads = MyThread.all
  end

  # GET /my_threads/1 or /my_threads/1.json
  def show
    @my_thread = MyThread.find(params[:id])
  end

  # GET /my_threads/new
  def new
    @my_thread = MyThread.new
  end

  # GET /my_threads/1/edit
  def edit
  end

  # POST /my_threads or /my_threads.json
  def create
    @my_thread = MyThread.new(my_thread_params)

    respond_to do |format|
      if @my_thread.save
        format.html { redirect_to my_thread_url(@my_thread), notice: "My thread was successfully created." }
        format.json { render :show, status: :created, location: @my_thread }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @my_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /my_threads/1 or /my_threads/1.json
  def update
    respond_to do |format|
      if @my_thread.update(my_thread_params)
        format.html { redirect_to my_thread_url(@my_thread), notice: "My thread was successfully updated." }
        format.json { render :show, status: :ok, location: @my_thread }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @my_thread.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /my_threads/1 or /my_threads/1.json
  def destroy
    @my_thread = MyThread.find(params[:id])
    @my_thread.destroy

    respond_to do |format|
      format.html { redirect_to my_threads_url, notice: "My thread was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_my_thread
      @my_thread = MyThread.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def my_thread_params
      params.require(:my_thread).permit(:title)
    end
end
