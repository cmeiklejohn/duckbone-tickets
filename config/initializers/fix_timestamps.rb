# Rails flouts JavaScript and chooses to use XML's default (iso8601).
# Go back to RFC2822 so we can get native parsing.

[ActiveSupport::TimeWithZone, Time, Date, DateTime].each do |c|
  c.class_eval do
    def as_json(options = nil)
      if ActiveSupport::JSON::Encoding.use_standard_json_time_format
        rfc2822
      else
        %(#{time.strftime("%Y/%m/%d %H:%M:%S")} #{formatted_offset(false)})
      end
    end
  end
end
