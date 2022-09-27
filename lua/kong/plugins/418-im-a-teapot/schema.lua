local typedefs = require "kong.db.schema.typedefs"

local PLUGIN_NAME = "418-im-a-teapot"

-- custom field validator
-- simple check for / in content type
local function validate_fields(content_type)

  if string.match (content_type, "/") then
    return true
  end
    return nil, "Must contain a forward slash /"

end

local schema = {
  name = PLUGIN_NAME,
  fields = {
    { protocols = typedefs.protocols },
    { config = {
        type = "record",
        fields = {
          { content_type = { type = "string", default = "text/plain", custom_validator = validate_fields }, },
          { body = { type = "string", default = "418 I'm a Teapot", }, },
        },
      },
    },
  },
}

return schema
