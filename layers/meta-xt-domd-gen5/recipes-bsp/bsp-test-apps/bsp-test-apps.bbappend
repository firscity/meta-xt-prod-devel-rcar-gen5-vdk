FILESEXTRAPATHS:prepend := "${XT_PREBUILT_FWK}:"

# W/A to fix QA build issue
INSANE_SKIP:${PN} = "file-rdeps arch"
INSANE_SKIP:${PN}-dbg = "arch"
INHIBIT_PACKAGE_STRIP = "1"

SRC_URI:append = " \
    file://camfwk_fe.ko \
    file://disfwk_fe.ko \
    file://multifwk_freertos_sample_app_x5h.elf \
    file://multifwk_linux_sample_app_x5h \
"

do_install:append() {
    # Install prebuild modules, firmware and application for cam/disp fwk
    install -m 755 ${WORKDIR}/camfwk_fe.ko ${D}${ROOT_HOME}/camfwk_fe.ko
    install -m 755 ${WORKDIR}/disfwk_fe.ko ${D}${ROOT_HOME}/disfwk_fe.ko
    install -m 755 ${WORKDIR}/multifwk_freertos_sample_app_x5h.elf ${D}${ROOT_HOME}/multifwk_freertos_sample_app_x5h.elf
    install -m 755 ${WORKDIR}/multifwk_linux_sample_app_x5h ${D}${ROOT_HOME}/multifwk_linux_sample_app_x5h
}
