(function() {
  this.log = function() {
    try {
      return console.log.apply(console, arguments);
    } catch (_error) {}
  };

  this.trace_event = function(event_name, force) {
    if (event_name == null) {
      event_name = 'Undefined event';
    }
    if (force == null) {
      force = false;
    }
    if (false || force) {
      return log(event_name);
    }
  };

  this.dec = function(val) {
    return parseInt(val, 10);
  };

  this.to_int = function(val) {
    return dec(val);
  };

  this.to_f = function(val) {
    return parseFloat(val);
  };

  this.to_s = function(val) {
    return val + '';
  };

  this._first = function(ary) {
    return ary[0];
  };

  this._last = function(ary) {
    return ary[ary.length - 1];
  };

  this.global_event = function(name, trace) {
    if (trace == null) {
      trace = false;
    }
    if (trace) {
      log(name);
    }
    return $(document).trigger(name);
  };

  this.json2data = function(str, _default) {
    var e;
    if (_default == null) {
      _default = [];
    }
    try {
      return JSON.parse(str);
    } catch (_error) {
      e = _error;
      log(str);
      log("JSON parse error: " + e);
      return _default;
    }
  };

  this.data2json = function(data, _default) {
    var e;
    if (_default == null) {
      _default = '[]';
    }
    try {
      return JSON.stringify(data);
    } catch (_error) {
      e = _error;
      log(data);
      log("JSON stringify error: " + e);
      return _default;
    }
  };

}).call(this);
