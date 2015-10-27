### JQ ###
_build_jq() {
local VERSION="1.5"
local FOLDER="jq-${VERSION}"
local FILE="${FOLDER}.tar.gz"
local URL="https://github.com/stedolan/jq/releases/download/${FOLDER}/${FILE}"

_download_tgz "${FILE}" "${URL}" "${FOLDER}"
pushd "target/${FOLDER}"
./configure --host="${HOST}" --prefix="${DEST}" --disable-shared
make
make install
"${STRIP}" -s -R .comment -R .note -R .note.ABI-tag "${DEST}/bin/jq"
popd
}

### BUILD ###
_build() {
  _build_jq
  _package
}
