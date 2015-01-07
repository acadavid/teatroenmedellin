module ActsHelper

  def render_acts_dates
    if @acts_date.empty?
      content_tag(:section, content_tag(:h3, "No se encontraron eventos para la fecha seleccionada"))
    else
      render partial: "show", collection: @acts_date
    end
  end
end
