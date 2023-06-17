# Distributed under the OSI-approved MIT License.  See accompanying
# file LICENSE or https://github.com/Crascit/DownloadProject for details.

cmake_minimum_required(VERSION 3.10)

project(pdfium-download NONE)

include(ExternalProject)
ExternalProject_Add(pdfium-download
                    URL;https://github.com/bblanchon/pdfium-binaries/releases/download/chromium/5200/pdfium-linux-x64.tgz
                    SOURCE_DIR          "/home/idir/Desktop/Projects/dive-club/build/linux/x64/debug/pdfium-src"
                    BINARY_DIR          "/home/idir/Desktop/Projects/dive-club/build/linux/x64/debug/pdfium-build"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
                    DOWNLOAD_EXTRACT_TIMESTAMP true
)
