#!/bin/bash

# -------------------------------------------------------
# Info:
# 	Miroslav Vidovic
# 	basic-info.sh
# 	02.07.2016.-14:22:39
# -------------------------------------------------------
# Description:
#   Program to output a system information page in html.
# -------------------------------------------------------
# Script:

services(){
     echo "
          <h2> + runing | - not running </h2>
          <PRE>$(sudo service --status-all)</PRE>
    "
    return
}

write_html_page () {
  cat ../templates/header.html
  cat ../templates/menu.html
  cat << _EOF_
  <!-- Page Content -->
  <div id="page-content-wrapper">
      <div class="container-fluid">
          <div class="row text-center">
              <div class="col-lg-12">
                  <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Toggle Menu</a>
                  <h1>Services information</h1>
              </div>
          </div>

          <div class="row">
              <div class="clo-lg-12">
                  $(services)
              </div>
          </div>

      </div>
  </div>
  <!-- /#page-content-wrapper -->
_EOF_
cat ../templates/footer.html

return
}

write_html_page > ../public_html/services.html

exit 0
