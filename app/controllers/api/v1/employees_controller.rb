class Api::V1::EmployeesController < ApiController

  # 拾えなかったExceptionが発生したら500 Internal server errorを応答する
  rescue_from Exception, with: :render_status_500

  #  rescue_from 特定の種類または複数の種類の例外を1つのコントローラ全体およびそのサブクラスで扱えるようにする
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  
  def index
    @employees = Employee.select(:id, :name, :department, :gender)
    render json: @employees
  end
  
  def show
    @employee = Employee.find(params[:id])
    render json: @employee
  end

  def create
    employee = Employee.new(employee_params)
    if employee.save
      render json: employee, status: :created 
    else
      render json: { errors: employee.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      head :no_content
    else
      render json: { errors: @employee.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy!
    head :no_content
  end
  
  private
  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  def record_not_found
    render json: { error: '404 not found' }, status: 404
  end

  def render_status_500(exception)
    render json: { errors: [exception] }, status: 500
  end

  def employee_params
    params.require(:employee).permit(:name, :department, :gender, :birth, :joined_date, :payment, :note)
  end
end
