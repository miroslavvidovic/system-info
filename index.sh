#!/bin/bash

# -------------------------------------------------------
# Info:
# 	Miroslav Vidovic
# 	basic-info.sh
# 	16.01.2016.-14:22:39
# -------------------------------------------------------
# Description:
#   Program to output a system information page in html.
# -------------------------------------------------------
# Script:

TITLE="Report for $HOSTNAME"
CURRENT_TIME=`date +%d.%m.%Y.-%H:%M:%S`
TIME_STAMP="Generated $CURRENT_TIME, by $USER"

# Form and write the HTML page
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
                  <h1>System information</h1>
                  <h2>$TITLE</h2>
                  <p>$TIME_STAMP</p>
              </div>
          </div>

          <div class="row text-center">

              <div class="col-lg-4">
                  <h2>Complete system information</h2>
              </div>

              <div class="col-lg-4">
                  <img class="img-responsive" src="images/sys_info.png"/>
              </div>

              <div class="col-lg-4">
                  <h2>Used tools:</h2>
                  <ul>
                      <li>uptime</li>
                      <li>testing</li>
                      <li>df</li>
                      <li>lsb_release</li>
                      <li>uname</li>
                      <li>du</li>
                      <li>lscpu</li>
                      <li>lspci</li>
                      <li>lsscsi</li>
                      <li>lsblk</li>
                      <li>lsusb</li>
                  </ul>
              </div>

          </div>

      </div>
  </div>
  <!-- /#page-content-wrapper -->
_EOF_
cat templates/footer.html

return
}

write_html_page > public_html/index.html

exit 0
