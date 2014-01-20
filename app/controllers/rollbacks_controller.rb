class RollbacksController < ApplicationController
  def index
    @rollbacks = Rollback.all.fetch
  end

  def new
    @rollback = Rollback.new
  end

  def create
    @rollback = Rollback.new(rollback_params)

    if @rollback.save
      redirect_to rollbacks_path, notice: 'Rollback was scheduled'
    else
      @rollback.initialize_errors

      render :new
    end
  end

  private

  def rollback_params
    params.require(:rollback).permit(:date, :redownload)
  end
end