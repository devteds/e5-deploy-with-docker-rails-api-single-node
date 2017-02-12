class ApplicationController < ActionController::API
    
    private
    def page
      @page ||= params[:page] || 1
    end

    def per_page
      @per_page ||= params[:per_page] || 10
    end

    def set_pagination_headers(v_name)
      pc = instance_variable_get("@#{v_name}")
      
      headers["X-Total-Count"] = pc.total_count

      links = []
      links << page_link(1, "first") unless pc.first_page?
      links << page_link(pc.prev_page, "prev") if pc.prev_page
      links << page_link(pc.next_page, "next") if pc.next_page
      links << page_link(pc.total_pages, "last") unless pc.last_page?
      headers["Link"] = links.join(", ") if links.present?
    end

    def page_link(page, rel)
      # "<#{posts_url(request.query_parameters.merge(page: page))}>; rel='#{rel}'"
      base_uri = request.url.split("?").first
      "<#{base_uri}?#{request.query_parameters.merge(page: page).to_param}>; rel='#{rel}'"
    end    
end
