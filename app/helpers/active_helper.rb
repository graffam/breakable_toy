module ActiveHelper
  def is_active?(controller,page_name)
    "active" if params[:action] == page_name && 
                params[:controller] == controller
  end

  def is_active_metric?(metric)
    "active" if params[:format] == metric
  end
end
