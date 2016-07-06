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

dmidecode_info(){
     echo "
          <H2>Dmidecode information</H2>
          <PRE>$(sudo dmidecode)</PRE>
    "
    return
}

write_html_page () {
  cat templates/header.html
  cat templates/menu.html
  cat << _EOF_
  <!-- Page Content -->
  <div id="page-content-wrapper">
      <div class="container-fluid">
          <div class="row text-center">
              <div class="col-lg-12">
                  <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Toggle Menu</a>
                  <h1>Dmidecode information</h1>
              </div>
          </div>

          <div class="row">
              <div class="clo-lg-12">
                  $(dmidecode_info)
              </div>
          </div>

      </div>
  </div>
  <!-- /#page-content-wrapper -->
_EOF_
cat templates/footer.html

return
}

write_html_page > public_html/dmidecode_info.html

exit 0
