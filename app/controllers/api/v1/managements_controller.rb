module Api::V1
  class ManagementsController < ApiController
    
    # GET / POST Management resource
    def managements
      if request.get?
        managements = Management.arrange_serializable do |parent, children|
                        {
                          id: parent.id,
                          area: parent.area,
                          grade: parent.grade,
                          children: children,
                        }
                      end
      	render json: managements
      elsif request.post?
        if params[:parent_id] && params[:area] && params[:grade]
          existent = Management.where(area: params[:area]).first
          if existent.nil?
          	new_management = Management.create(management_params)
            render json: { message: "El área '#{new_management.area}' ha sido creada exitosamente.", status: 200 } 
          else 
            render json: { message: "El área '#{existent.area}' ya existe.", status: 404 } 
          end
        else 
          render json: { message: "Faltan parámetros para creación de nuevo recurso.", status: 404 }
        end
       end
    end

		# PUT Management resource
    def update
      if params[:id] && params[:area] && params[:grade]
        updated_management = Management.where(id: params[:id]).first
	unless updated_management.nil?
	  updated_management.update(management_params)
	  if updated_management.save
	    render json: updated_management
	  else
	  # Grade under 0
	    render json: { message: "Ocurrió un error inesperado, reintente nuevamente.", status: 404 }		
	  end
         end	
       else 
         render json: { message: "Faltan parámetros para update de recurso.", status: 404 }
       end
     end

    private
      def management_params
        params.permit(:parent_id, :area, :grade)
      end
  end
end

