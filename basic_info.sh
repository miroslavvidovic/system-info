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

# System uptime
report_uptime () {
  echo "
          <H2>System Uptime</H2>
          <PRE>$(uptime)</PRE>
  "
  return
}

# HDD usage
report_disk_space () {
  echo "
          <H2>Disk Space Utilization</H2>
          <PRE>$(df -h)</PRE>
  "
  return
}

# Os info
report_os_info(){
  echo "
          <H2>System info</H2>
          <PRE>$(lsb_release -a)</PRE>
          <PRE>$(uname -mrs)</PRE>
  "
  return

}

# Home dir usage
report_home_space () {
# Check if the user is superuser
  if [[ $(id -u) -eq 0 ]]; then
    echo "
          <H2>Home Space Utilization</H2>
          <PRE>$(du -sh /home/*)</PRE>
    "
  else
    echo "
          <H2>Home Space Utilization</H2>
          <PRE>$(du -sh $HOME)</PRE>
    "
  fi
  return
}

# Form and write the HTML page
write_html_page () {
  cat templates/header.html
  cat templates/menu.html
  cat << _EOF_
  <!-- Page Content -->
  <div id="page-content-wrapper">
      <div class="container-fluid">
          <div class="row">
              <div class="col-lg-12">
                  <a href="#menu-toggle" class="btn btn-default" id="menu-toggle">Toggle Menu</a>
                  <h1>System information</h1>
                    <h2>$TITLE</h2>
                         <p>$TIME_STAMP</p>
                         $(report_uptime)
                         $(report_os_info)
                         $(report_disk_space)
                         $(report_home_space)
              </div>
          </div>
      </div>
  </div>
  <!-- /#page-content-wrapper -->
_EOF_
cat templates/footer.html

return
}

write_html_page > public_html/basic_info.html

exit 0
