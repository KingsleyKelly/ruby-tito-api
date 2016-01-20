module Tito
  module Eventable
    def path(params=nil)
      prefix_path = '%{account_id}/%{event_id}'
      path_params = params.delete(:path) || params
      path_params[:event_id] = params[:event][:id]
      path_params[:account_id] = params[:event][:account_id]
      parts = [].unshift(prefix_path % path_params.symbolize_keys)
      parts << params[:type]
      File.join(*parts)
      rescue KeyError
        raise ArgumentError, "Please make sure to include account_id and event_id"
    end
  end
end