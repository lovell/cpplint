#!/usr/bin/env bash
set -e

VERSION_CPPLINT_CPP="0.3.0"

populate() {
  local PLATFORM="${1}"
  local PACKAGE="${2}"
  local WHEEL_FILE="cpplint_cpp-${VERSION_CPPLINT_CPP}-py3-none-${PLATFORM}.whl"

  if [ ! -f "${WHEEL_FILE}" ]; then
    echo "Downloading ${WHEEL_FILE}..."
    curl --silent --location --remote-name "https://github.com/matyalatte/cpplint-cpp/releases/download/v${VERSION_CPPLINT_CPP}/${WHEEL_FILE}"
  else
    echo "Using cached ${WHEEL_FILE}..."
  fi
  unzip -j -o "${WHEEL_FILE}" "cpplint_cpp-${VERSION_CPPLINT_CPP}.data/data/bin/cpplint-cpp*" -d "${PACKAGE}/bin"
  unzip -j -o "${WHEEL_FILE}" "cpplint_cpp-${VERSION_CPPLINT_CPP}.dist-info/LICENSE" -d "${PACKAGE}"
  if [ -f "${PACKAGE}/bin/cpplint-cpp" ]; then
    chmod +x "${PACKAGE}/bin/cpplint-cpp"
  fi
}

populate "linux_aarch64" "linux-arm64"
populate "linux_x86_64" "linux-x64"
populate "macosx_10_15_universal2" "darwin"
populate "win_amd64" "win32-x64"
populate "win_arm64" "win32-arm64"
