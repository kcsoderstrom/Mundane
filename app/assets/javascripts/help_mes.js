$.Updater = function(el) {
  this.$el = $(el);
  this.bindEvents();
  this.minUpdatedAt = null;
  console.log(this.$el);
}

$.Updater.prototype.bindEvents = function () {
  this.$el.on("click", "button.update-dat", this.handleClick.bind(this));
};

$.Updater.prototype.handleClick = function (event) {
  event.preventDefault();

  var params = {};
  if (this.minUpdatedAt) {
    params.min_updated_at = this.minUpdatedAt;
  }

  var that = this;

  $.ajax({
    type: 'get',
    dataType: 'json',
    data: params,
    url: "/help_mes",   // that's terrible but ok
    success: function(data) {
      console.log(data);
      if (data.length > 0) {
        that.minUpdatedAt = data[data.length - 1].updated_at;
        that.$el.append(data[0]); // really ugly but on purpose ok
      }

      console.log(that.minUpdatedAt);
    }
  });

};


$.fn.updater = function() {
  return this.each(function () {
    new $.Updater(this);
  });
};

$(function () {
  $("table.panicks").updater();
})