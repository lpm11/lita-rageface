require 'json'

module Lita
  module Handlers
    class Rageface < Handler
      config :sort_key, type: Symbol, default: :views
      config :image_key, type: Symbol, default: :png

      route /^rage\s+(.*)/i, :rage, command: false, help: {
        "rage QUERY" => "Return the first rage face image for QUERY from alltheragefaces.com."
      }

      def rage(response)
        query = response.matches[0][0]
        query.gsub!(/\s+/, ",")

        http_response = http.get("http://alltheragefaces.com/api/search/#{query}")
        if (http_response.status==200)
          faces = JSON.parse(http_response.body, symbolize_names: true)

          if (faces.is_a?(Hash) && faces.key?(:error1))
            response.reply(faces[:error1])
            return
          end

          if (faces.is_a?(Array))
            faces.reject! { |f| !f.key?(config.sort_key) || !f.key?(config.image_key) }
            if (faces.empty?)
              response.reply("No results found (might #{config.sort_key} or #{config.image_key} is missing?)")
              return
            end

            face = faces.max_by { |f| f[config.sort_key].to_i() }
            response.reply(face[config.image_key])
          else
            response.reply("Parsing result failed.")
            return
          end
        else
          response.reply("Service unavailable.")
        end
      end
    end

    Lita.register_handler(Rageface)
  end
end
