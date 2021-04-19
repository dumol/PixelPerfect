#!/bin/sh
#
# Installer for https://github.com/dumol/PixelPerfect
#

set -o nounset

current_ver="0.2.0"
repo_name="PixelPerfect"
repo_owner="dumol"
user_config_dir="$HOME/.config"
user_font_dir="$HOME/.local/share/fonts"

repo_url="https://github.com/${repo_owner}/${repo_name}"
release_archive="${repo_url}/archive/refs/tags/v${current_ver}.tar.gz"
pkg_url_common="${repo_url}/releases/download/v${current_ver}"

echo
echo "PixelPerfect installer version ${current_ver}"
echo

command -v curl > /dev/null
if [ $? -ne 0 ]; then
    echo "This installer requires curl."
    exit 13
fi

set -o errexit

for user_dir in ${user_config_dir} ${user_font_dir}; do
    if [ ! -d ${user_dir} ]; then
        echo "${user_dir} not found, creating it..."
        mkdir -p ${user_dir}
    fi
done

echo "Downloading and unpacking release $current_ver to /tmp..."
curl -s -L ${release_archive} | tar xz -C /tmp
if [ -d ${user_config_dir}/fontconfig ]; then
    echo "Found ${user_config_dir}/fontconfig, renaming it..."
    mv -v ${user_config_dir}/fontconfig ${user_config_dir}/fontconfig.bkp
fi
echo "Installing PixelPerfect rules to ${user_config_dir}/fontconfig..."
mv /tmp/${repo_name}-${current_ver} ${user_config_dir}/fontconfig

for font_pkg in common-aliases common-extra lowdpi-aliases lowdpi-extra; do
    echo "Installing $font_pkg font package to ${user_font_dir}..."
    curl -s -L ${pkg_url_common}/${font_pkg}-v${current_ver}.tar.gz \
        | tar xz -C ${user_font_dir}
done

echo
echo "PixelPerfect setup installed successfully! Please logout and login again."
echo
