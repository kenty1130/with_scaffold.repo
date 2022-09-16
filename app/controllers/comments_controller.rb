class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
    @my_thread = MyThread.find(params[:my_thread_id])
  end

  # GET /comments/1 or /comments/1.json
  def show
    @my_thread = MyThread.find(params[:my_thread_id])
    @comment = @my_thread.comments.find(params[:id])
  end

  # GET /comments/new
  def new
    @my_thread = MyThread.find(params[:my_thread_id])
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    @my_thread = MyThread.find(params[:my_thread_id])
    @comment = @my_thread.comments.find(params[:id])
  end

  # POST /comments or /comments.json
  def create
    @my_thread = MyThread.find(params[:my_thread_id])
    @comment = Comment.new(comment_params)
    @comment.my_thread_id = params[:my_thread_id]
    @comment.id = params[:id]

    respond_to do |format|
      if @comment.save
        format.html { redirect_to my_thread_comments_url(@comment), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    @my_thread = MyThread.find(params[:my_thread_id])
    @comment = @my_thread.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to my_thread_comments_url(@my_thread), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @my_thread = MyThread.find(params[:my_thread_id])
    @comment = @my_thread.comments.find(params[:id])
    @comment.destroy
    redirect_to my_thread_comments_path(@my_thread)
    respond_to do |format|
      format.html { redirect_to my_thread_comments_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:my_thread_id, :body)
    end
end
