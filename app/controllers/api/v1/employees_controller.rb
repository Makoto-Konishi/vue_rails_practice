class Api::V1::EmployeesController < ApiController

  #  rescue_from 特定の種類または複数の種類の例外を1つのコントローラ全体およびそのサブクラスで扱えるようにする
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  
  def index
    @employees = Employee.all
    render json: @employees
  end
  
  def show
    @employee = Employee.find(params[:id])
    render json: @employee
  end
  
  private
  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  def record_not_found
    render json: { error: '404 not found' }, status: 404
  end
end
