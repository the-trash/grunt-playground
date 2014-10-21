#################################
# LOGGING
#################################

@log = -> try console.log.apply(console, arguments)

@trace_event = (event_name = 'Undefined event', force = false) ->
  log event_name if false or force

#################################
# CONVERSIONS
#################################

@dec    = (val) -> parseInt val, 10
@to_int = (val) -> dec val
@to_f   = (val) -> parseFloat val
@to_s   = (val) -> val + ''

#################################
# ARRAY
#################################

@_first = (ary) -> ary[0]
@_last  = (ary) -> ary[ary.length - 1]

#################################
# EVENTS
#################################

@global_event = (name, trace = false) ->
  log name if trace
  $(document).trigger name

#################################
# JSON
#################################

@json2data = (str, _default = []) ->
  try
    JSON.parse str
  catch e
    log str
    log "JSON parse error: #{ e }"
    _default

@data2json = (data, _default = '[]') ->
  try
    JSON.stringify data
  catch e
    log data
    log "JSON stringify error: #{ e }"
    _default
