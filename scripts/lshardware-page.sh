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

cpu_info () {
  echo "
          <H2>Cpu</H2>
          <PRE>$(lscpu)</PRE>
  "
  return
}

pci_info () {
  echo "
          <H2>PCI info</H2>
          <PRE>$(lspci -v)</PRE>
  "
  return
}

sata_drives () {
    echo "
          <H2>Sata drives</H2>
          <PRE>$(lsscsi)</PRE>
    "
    return
}

block_devices(){
echo "
          <H2>Block devices - drives</H2>
          <PRE>$(lsblk -a)</PRE>
    "
    return
}

usb_drives(){
    echo "
          <H2>USB drives</H2>
          <PRE>$(lsusb -v)</PRE>
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
                  <h1>LS Hardware information</h1>
              </div>
          </div>

          <div class=row>
              <div class="col-lg-12">
                  <h2>$TITLE</h2>
                  $(cpu_info)
                  $(pci_info)
                  $(sata_drives)
                  $(usb_drives)
              </div>
          </div>

      </div>
  </div>
  <!-- /#page-content-wrapper -->
_EOF_
cat ../templates/footer.html

return
}

write_html_page > ../public_html/lshardware.html

exit 0
