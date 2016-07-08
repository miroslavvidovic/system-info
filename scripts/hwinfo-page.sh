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

hwinfo_i(){
     echo "
          <PRE>$(sudo hwinfo)</PRE>
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
                  <h1>Hwinfo information</h1>
              </div>
          </div>

          <div class=row>
              <div class="col-lg-12">
                  <h2>$TITLE</h2>
                  $(hwinfo_i)
              </div>
          </div>

      </div>
  </div>
  <!-- /#page-content-wrapper -->
_EOF_
cat ../templates/footer.html

return
}

write_html_page > ../public_html/hwinfo.html

exit 0
