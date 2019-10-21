import I18n from "i18n-js/index.js.erb"
$(document).ready(function () {
  $("#micropost_picture").bind("change", function() {
    var size_in_megabytes = this.files[0].size/(I18n.t("unit"))/(I18n.t("unit"));
    if (size_in_megabytes > I18n.t("size_in_megabytes")) {
      alert(I18n.t("max_size_image"));
    }
  });
});
