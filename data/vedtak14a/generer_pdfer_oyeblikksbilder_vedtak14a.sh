#!/opt/homebrew/bin/bash
set -euo pipefail

PDF_ENDPOINT_BASE="http://localhost:8081/api/v1/genpdf/vedtak14a"
OUTPUT_FOLDER="${1:-$HOME/Downloads/vedtak14a/oyeblikksbilder}"
mkdir -p "$OUTPUT_FOLDER"
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

templates=(
  "oyeblikkbilde-behovsvurdering"
  "oyeblikkbilde-cv"
  "oyeblikkbilde-arbeidssokerregistret"
)

filnavn_for_template() {
  case "$1" in
    "oyeblikkbilde-behovsvurdering") echo "behovsvurdering.pdf" ;;
    "oyeblikkbilde-cv") echo "cv.pdf" ;;
    "oyeblikkbilde-arbeidssokerregistret") echo "arbeidssokerregisteret.pdf" ;;
    *) echo "$1.pdf" ;;
  esac
}

for template in "${templates[@]}"; do
  filnavn=$(filnavn_for_template "$template")
  json_file="$SCRIPT_DIR/$template.json"
  tmp_file="$(mktemp "$OUTPUT_FOLDER/.${filnavn}.XXXXXX")"

  echo "🌱 Genererer PDF for template=$template som $filnavn"

  curl -sS -X POST "$PDF_ENDPOINT_BASE/${template}" \
    -H "Content-Type: application/json" \
    --data-binary @"$json_file" \
    --output "$tmp_file"

  if [[ "$(file -b --mime-type "$tmp_file")" != "application/pdf" ]]; then
    echo "❌ Fikk ikke en PDF for template=$template" >&2
    rm -f "$tmp_file"
    exit 1
  fi

  mv "$tmp_file" "$OUTPUT_FOLDER/$filnavn"

  sleep 1
done

echo "✅ Ferdig genererte pdfer for øyeblikksbildene i $OUTPUT_FOLDER"
