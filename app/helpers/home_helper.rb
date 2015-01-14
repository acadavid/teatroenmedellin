module HomeHelper

  def render_act_dates(act_dates)
    if act_dates.empty?
      content_tag(:section, content_tag(:h3, "No se encontraron eventos para la fecha seleccionada"))
    else
      render partial: "show", collection: act_dates
    end
  end

end
