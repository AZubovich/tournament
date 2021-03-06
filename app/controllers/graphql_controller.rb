class GraphqlController < ApplicationController
  skip_before_action :verify_authenticity_token
  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      # Query context goes here, for example:
      current_user: current_user,
      sign_in: ->(user) { sign_in(user) },
      sign_out: ->(user) { sign_out(user) },
      session: session,
      nickname: generate_nick_name
    }
    result = BackendSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  rescue => e
    raise e unless Rails.env.development?
    handle_error_in_development e
  end

  private
  
  

  def generate_nick_name
    gen_name = ([*('a'..'z'),*('0'..'9'),*('A'..'Z')]).sample(6).join
    old_name = User.where(nick_name: gen_name).last
    if old_name.present?
      generate_nick_name
    else
      gen_name
    end
  end
  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { error: { message: e.message, backtrace: e.backtrace }, data: {} }, status: 500
  end
end
